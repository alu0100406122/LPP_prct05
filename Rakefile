

desc "Pruebas unitarias de la clase Racional"
task :default do
  sh "ruby -I. test/tc_racional.rb"
end

desc "Ejecutar solo las pruebas simples"
task :simple do
  sh "ruby -I. test/tc_point.rb -n /simple/"
end