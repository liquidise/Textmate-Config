#!/usr/bin/env ruby
# encoding: utf-8

if ENV['TM_PROJECT_DIRECTORY']

  SUPPORT = ENV['TM_SUPPORT_PATH']
  BUN_SUP = ENV['TM_BUNDLE_SUPPORT']

  require SUPPORT + '/lib/exit_codes'
  require SUPPORT + '/lib/escape'
  require SUPPORT + '/lib/textmate'
  require SUPPORT + '/lib/web_preview'
  require SUPPORT + '/lib/tm/htmloutput'

  require BUN_SUP + '/lib/fm/flex_mate'
  require BUN_SUP + '/lib/fm/sdk'

  # Start by trying to add the Flex SDK bin to $PATH then testing for fcsh.
  FlexMate::SDK.add_flex_bin_to_path

  TextMate.require_cmd "fcsh"

  bp = ENV['TM_PROJECT_DIRECTORY']
  
  # TODO check for custom build files and execute them where they exist.
  #custom = "#{bp}/#{ENV['TM_FLEX_BUILD_FILE']}"  
  #if File.executable?(custom)
  # `#{e_sh(custom)}`
  #end
  
  s = { :files => ['TM_FLEX_FILE_SPECS'], 
        :evars => ['TM_FLEX_OUTPUT'],
        :base_path => bp }

  FlexMate.required_settings(s)

  file_specs  = bp + '/' + ENV['TM_FLEX_FILE_SPECS']
  flex_output = bp + '/' + ENV['TM_FLEX_OUTPUT']
  fcsh       = e_sh(ENV['TM_FLEX_PATH'] + '/bin/fcsh')

  FlexMate.check_valid_paths([file_specs,flex_output,fcsh])

  mxmlc_args="mxmlc -o=#{flex_output} -file-specs=#{file_specs}"
  
  `osascript -e 'tell application "Terminal" to activate'` unless ENV['TM_FLEX_BACKGROUND_TERMINAL']
  `#{e_sh ENV['TM_BUNDLE_SUPPORT']}/lib/fcsh_terminal \"#{fcsh}\" \"#{mxmlc_args}\" >/dev/null;`
  
else
  
  require ENV['TM_BUNDLE_SUPPORT']+'/lib/flex_env'

  STDOUT.sync = true

  c = FlexMate::Compiler.new
  c.build
  
  #TODO: Get the html window to show immediately.
  TextMate.exit_show_html

end  