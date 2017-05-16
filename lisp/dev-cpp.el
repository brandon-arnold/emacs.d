
;; C/++ Tags
;; http://www.emacswiki.org/emacs/BuildTags
(setq tags-table-list 
      '( "~/.emacs.d/TAGS" ))
(if (eq system-type 'windows-nt)
    (add-to-list 'tags-table-list "C:/Program Files (x86)/emacs/TAGS"))

;; ETAGS build command (from cygwin, the final dash is important):
;; find . -type f -name "*.el" | etags -
;; find . -type f -name "*.el" -o -name "*.c" -o -name "*.cpp" | etags -
