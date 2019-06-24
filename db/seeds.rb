# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Seeding the equipment...'

[
    {
        code: 'CCT-00012/2015', 
        name: 'Colorímetro', 
        location: nil, 
        calibration_unit: 'ABS',
        calibration_start: '0.59',
        calibration_end: '1.77',
        uncertainty: '0.1'   
    },
    {
        code: 'CCT-00011/2015', 
        name: 'Medidor de Oxigêncio', 
        location: nil, 
        calibration_unit: 'mg/L',
        calibration_start: '0.1',
        calibration_end: '1000',
        uncertainty: '0.6'  
    },
    {
        code: 'CCL-3081/2014', 
        name: 'Termômetro', 
        location: nil, 
        calibration_unit: '°C',
        calibration_start: '-10',
        calibration_end: '40',
        uncertainty: '0.07'  
    },
    {
        code: 'CCL-3086/2014', 
        name: 'Termômetro', 
        location: nil, 
        calibration_unit: '°C',
        calibration_start: '-10',
        calibration_end: '40',
        uncertainty: '0.07' 
    },
    {
        code: 'CCL-3082/2014', 
        name: 'Termômetro', 
        location: nil, 
        calibration_unit: '°C',
        calibration_start: '-25',
        calibration_end: '110',
        uncertainty: '0.07' 
    },
    {
        code: 'CCL-3083/2014', 
        name: 'Termômetro', 
        location: nil, 
        calibration_unit: '°C',
        calibration_start: '-25',
        calibration_end: '110',
        uncertainty: '0.07' 
    },
    {
        code: 'CCL-3080/2014', 
        name: 'Termômetro', 
        location: nil, 
        calibration_unit: '°C',
        calibration_start: '10',
        calibration_end: '30',
        uncertainty: '0.07' 
    },
    {
        code: 'CCL-3079/2014', 
        name: 'Termômetro', 
        location: nil, 
        calibration_unit: '°C',
        calibration_start: '10',
        calibration_end: '30',
        uncertainty: '0.07' 
    },
    {
        code: 'CCL-3078/2014', 
        name: 'Termômetro', 
        location: nil, 
        calibration_unit: '°C',
        calibration_start: '10',
        calibration_end: '30',
        uncertainty: '0.07' 
    },
    {
        code: 'CCL-228/2015', 
        name: 'Manômetro', 
        location: nil, 
        calibration_unit: 'Bar',
        calibration_start: '0',
        calibration_end: '6',
        uncertainty: '0.28' 
    },
    {
        code: 'CCL-493/2015', 
        name: 'pHmetro', 
        location: nil, 
        calibration_unit: 'pH',
        calibration_start: '4',
        calibration_end: '10',
        uncertainty: nil 
    },
    {
        code: 'CCL-494/2015', 
        name: 'Condutivímetro', 
        location: nil, 
        calibration_unit: 'us/cm2',
        calibration_start: '200',
        calibration_end: '1999',
        uncertainty: '0.07' 
    },
    {
        code: 'CCL-1037/2015', 
        name: 'Balança', 
        location: nil, 
        calibration_unit: 'g',
        calibration_start: '0.50',
        calibration_end: '32000',
        uncertainty: '0.01' 
    },
    {
        code: 'CCL-11252/2014', 
        name: 'Balança', 
        location: nil, 
        calibration_unit: 'g',
        calibration_start: '0.0010',
        calibration_end: '220.00',
        uncertainty: nil 
    }
].each { |equipment|
    Equipment.find_or_create_by(code: equipment[:code]) do |e|
        e.name = equipment[:name]
        e.location = equipment[:location]
        e.calibration_unit = equipment[:calibration_unit]
        e.calibration_start = equipment[:calibration_start]
        e.calibration_end = equipment[:calibration_end]
        e.uncertainty = equipment[:uncertainty]
    end
}


puts 'Seeding Issues, Causes and Actions...'
[
    {
        code: 'P1',
        code_type: 'Problemas',
        title: 'Nenhum'      
    },
    {
        code: 'P2',
        code_type: 'Problemas',
        title: 'Folgado'
    },
    {
        code: 'P3',
        code_type: 'Problemas',
        title: 'Solto'
    },
    {
        code: 'P4',
        code_type: 'Problemas',
        title: 'Quebrado'
    },
    {
        code: 'P5',
        code_type: 'Problemas',
        title: 'Oxidado'
    },
    {
        code: 'P6',
        code_type: 'Problemas',
        title: 'Queimado'
    },
    {
        code: 'P7',
        code_type: 'Problemas',
        title: 'Em Curto'
    },
    {
        code: 'P8',
        code_type: 'Problemas',
        title: 'Desalinhado'
    },
    {
        code: 'P9',
        code_type: 'Problemas',
        title: 'Baixa Velocidade'
    },
    {
        code: 'P10',
        code_type: 'Problemas',
        title: 'Barulho'
    },
    {
        code: 'P11',
        code_type: 'Problemas',
        title: 'Segurança'
    },
    {
        code: 'P12',
        code_type: 'Problemas',
        title: 'Temperatura Alta'
    },
    {
        code: 'P13',
        code_type: 'Problemas',
        title: 'Temperatura Baixa'
    },
    {
        code: 'P14',
        code_type: 'Problemas',
        title: 'Entupido'
    },
    {
        code: 'P15',
        code_type: 'Problemas',
        title: 'Intermitente'
    },
    {
        code: 'P16',
        code_type: 'Problemas',
        title: 'Balanceamento'
    },
    {
        code: 'P17',
        code_type: 'Problemas',
        title: 'Instabilidade'
    },
    {
        code: 'P18',
        code_type: 'Problemas',
        title: 'Leitura Incorreta'
    }
].each { |issue|
        Issue.find_or_create_by(code: issue[:code]) do |c|
            c.code = issue[:code]
            c.code_type = issue[:code_type]
            c.title = issue[:title]
        end
    }


[
    {
        code: 'C1',
        code_type: 'Causas',
        title: 'Não Aplicável'
    },
    {
        code: 'C2',
        code_type: 'Causas',
        title: 'Desativado'
    },
    {
        code: 'C3',
        code_type: 'Causas',
        title: 'Objeto Estranho'
    },
    {
        code: 'C4',
        code_type: 'Causas',
        title: 'Interrompido'
    },
    {
        code: 'C5',
        code_type: 'Causas',
        title: 'Controles'
    },
    {
        code: 'C6',
        code_type: 'Causas',
        title: 'Queda de Energia'
    },
    {
        code: 'C7',
        code_type: 'Causas',
        title: 'Sobrecarga'
    },
    {
        code: 'C8',
        code_type: 'Causas',
        title: 'Transporte'
    },
    {
        code: 'C9',
        code_type: 'Causas',
        title: 'Desgaste'
    },
    {
        code: 'C10',
        code_type: 'Causas',
        title: 'Ambiente'
    },
    {
        code: 'C11',
        code_type: 'Causas',
        title: 'Danificado'
    },
    {
        code: 'C12',
        code_type: 'Causas',
        title: 'Acionadores'
    },
    {
        code: 'C13',
        code_type: 'Causas',
        title: 'Programa'
    },
    {
        code: 'C14',
        code_type: 'Causas',
        title: 'Falha Operacional'
    },
    {
        code: 'C15',
        code_type: 'Causas',
        title: 'Qualidade'
    },
    {
        code: 'C16',
        code_type: 'Causas',
        title: 'Alimentação'
    },
    {
        code: 'C17',
        code_type: 'Causas',
        title: 'Desalinhamento'
    },
    {
        code: 'C18',
        code_type: 'Causas',
        title: 'Instalação'
    },
    {
        code: 'C19',
        code_type: 'Causas',
        title: 'Sujeira'
    }
].each { |cause|
        Cause.find_or_create_by(code: cause[:code]) do |c|
            c.code = cause[:code]
            c.code_type = cause[:code_type]
            c.title = cause[:title]
        end
    }



[
    {
        code: 'A1',
        code_type: 'Ações',
        title: 'Substituído'
    },
    {
        code: 'A2',
        code_type: 'Ações',
        title: 'Reformado'
    },
    {
        code: 'A3',
        code_type: 'Ações',
        title: 'Vedado'
    },
    {
        code: 'A4',
        code_type: 'Ações',
        title: 'Calibrado'
    },
    {
        code: 'A5',
        code_type: 'Ações',
        title: 'Condicionado'
    },
    {
        code: 'A6',
        code_type: 'Ações',
        title: 'Lubrificado'
    },
    {
        code: 'A7',
        code_type: 'Ações',
        title: 'Ajustado'
    },
    {
        code: 'A8',
        code_type: 'Ações',
        title: 'Limpo'
    },
    {
        code: 'A9',
        code_type: 'Ações',
        title: 'Removido'
    },
    {
        code: 'A10',
        code_type: 'Ações',
        title: 'Instalado'
    },
    {
        code: 'A11',
        code_type: 'Ações',
        title: 'Modificado'
    },
    {
        code: 'A12',
        code_type: 'Ações',
        title: 'Faltou Material'
    },
    {
        code: 'A13',
        code_type: 'Ações',
        title: 'Alinhado'
    },
    {
        code: 'A14',
        code_type: 'Ações',
        title: 'Reprogramado'
    },
    {
        code: 'A15',
        code_type: 'Ações',
        title: 'Checagem Rotação'
    },
    {
        code: 'A16',
        code_type: 'Ações',
        title: 'Inspecionado'
    },
    {
        code: 'A17',
        code_type: 'Ações',
        title: 'Rotina de Testes'
    }
].each { |code|
    Action.find_or_create_by(code: code[:code]) do |c|
        c.code = code[:code]
        c.code_type = code[:code_type]
        c.title = code[:title]
    end
}

# Populate Parts Table

puts 'Seeding the Parts...'
[
    {
        description: 'Display'
    },
    {
        description: 'Terminais'
    },
    {
        description: 'Chaves de ON/OFF'
    },
    {
        description: 'Fusível'
    },
    {
        description: 'Cabos de Força'
    },
    {
        description: 'Conexões Elétricas'
    },
    {
        description: 'Termostato'
    },
    {
        description: 'Termômetro'
    },
    {
        description: 'Resistência'
    },
    {
        description: 'Eletrodo'
    },
    {
        description: 'Sensores'
    },
    {
        description: 'Lâmpada'
    },
    {
        description: 'Alinhamento'
    },
    {
        description: 'Rotação'
    },
    {
        description: 'Vibração'
    },
    {
        description: 'Alimentação'
    },
    {
        description: 'Vazão'
    },
    {
        description: 'Linha/Mangueira'
    },
    {
        description: 'Válvula'
    },
    {
        description: 'Programa'
    },
    {
        description: 'Escala'
    },
    {
        description: 'Temporizador'
    },
    {
        description: 'Sistema Óptico'
    },
    {
        description: 'Calibração'
    }
].each { |part|
    Part.find_or_create_by(description: part[:description])
}

puts 'Creating the user test'
User.create(username: "user_test", password: "123", email: "user@test.com", admin: true)
