# -*- mode: bash; tab-width: 2; -*-
# vim: ts=2 sw=2 ft=bash noet

builtin_document_root() {
  # boxfile builtin_document_root
  document_root=$(validate "$(payload boxfile_builtin_document_root)" "folder" "$(validate "$(payload boxfile_document_root)" "folder" "/")")
  if [[ ${document_root:0:1} = '/' ]]; then
    echo $document_root
  else
    echo /$document_root
  fi
}