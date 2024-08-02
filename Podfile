platform :ios, '15.0'

target 'IBM_iOS_Workshop' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'IBM_iOS_Workshop_Utils', :path => '~/IBM_iOS_Workshop'

  target 'IBM_iOS_WorkshopUITests' do
    use_frameworks!
    pod 'IBM_Workshop_UI_Test', :path => '~/IBM_iOS_Workshop'
  end

end

require 'xcodeproj'


def update_pod_build_phase_order(xcodeproj_path, target_name)
     puts "Updating build phase order of '[CP] Embed Pods Frameworks' in #{xcodeproj_path}, #{target_name} \n"
     project = Xcodeproj::Project.open(xcodeproj_path)
     target = project.targets.select { |t| t.name == target_name }.first
     puts "Found target: #{target.name}\n"
     cocoapods_index = target.build_phases.index { |b|
         name = b.name if b.respond_to? :name
         name == "[CP] Embed Pods Frameworks"
     }
     if cocoapods_index.nil? == false
         puts "#{target_name}: '[CP] Embed Pods Frameworks' index was: #{cocoapods_index}, moving to index 4.\n"
         target.build_phases.move_from(cocoapods_index, 4) # move further to the top
     end
     project.save
end


post_integrate do |installer|
    update_pod_build_phase_order("./IBM_iOS_Workshop.xcodeproj", "IBM_iOS_Workshop")
    update_pod_build_phase_order("./IBM_iOS_Workshop.xcodeproj", "IBM_iOS_WorkshopUITests")
end