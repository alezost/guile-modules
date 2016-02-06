;;; utils.scm --- Miscellaneous utilities

;; Copyright © 2016 Alex Kost

;; Author: Alex Kost <alezost@gmail.com>
;; Created:  6 Feb 2016

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This file provides various procedures that do not suit any other
;; module.

;;; Code:

(define-module (al utils)
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-1)
  #:export (mapconcat
            build-file-name
            comma-separated))

(define* (mapconcat proc lst #:optional (separator ""))
  "Apply PROC to each element of LST and concatenate the result strings
into a single string using SEPARATOR."
  (match lst
    (() "")
    ((elt . rest)
     (fold (lambda (elt res)
             (string-append res separator (proc elt)))
           (proc elt)
           rest))))

(define (comma-separated . strings)
  "Return string by concatenating STRINGS with commas."
  (mapconcat identity strings ","))

(define (build-file-name . file-parts)
  "Return file name by concatenating FILE-PARTS with slashes."
  (mapconcat identity file-parts "/"))

;;; utils.scm ends here
