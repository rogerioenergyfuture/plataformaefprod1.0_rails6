class AlteracoesProjeto < ActiveRecord::Migration[5.2]
  def change
    
    add_column :projects, :quantidadedefuncionariosppf, :integer
    add_column :projects, :resumoppf, :string
    add_column :projects, :detalhesppf, :string
    add_column :projects, :kindppf, :integer
    add_column :projects, :descricaoppf, :string
    add_column :projects, :categoriappf, :integer
    add_column :projects, :qualdorpretenderesolverppf, :string
    add_reference :projects,:companypower
    add_column :projects, :adotapraticasdegestaoppf,:integer
    add_column :projects, :processosdeoperacaoegestaoppf,:integer
    add_column :projects, :pesquisatecnologiasnaareadesuaatividadeppf,:integer
    add_column :projects, :avaliaoimpactodainovacaoppf,:integer
    add_column :projects, :executaparceriaseintercambiosppf,:integer
    add_column :projects, :valiaproblemasambientalppf,:integer
    add_column :projects, :definemetricasquantitativasparaaferirppf,:integer
    add_column :projects, :ofereceaoscolaboradoresmetodoscontroleegestaoppf,:integer 
    add_column :projects, :projetojarecebeualgumaporteppf,:integer
    add_column :projects, :qualvalortotaldosaportesrecebidosppf,:integer
    add_column :projects, :qualeaquantianecessariapararealizacaoppf,:integer
    add_column :projects, :qualamaiordificuldadequeoseuprojetoenfrentahojeppf, :string
    add_column :projects, :asuasolucaojatemconcorrentesnomercadoppf,:integer
    add_column :projects, :quantosconcorrentesppf,:integer
    add_column :projects, :quaismarcosjaforamatingidospeloprojetoppf,:integer
    add_column :projects, :qualeaestimativadetempoparaaconclusaoppf,:integer
  end
end
