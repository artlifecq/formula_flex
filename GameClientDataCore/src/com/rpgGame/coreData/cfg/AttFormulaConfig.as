package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.ClientAttFormula;
	import com.rpgGame.coreData.clientConfig.Q_att_transfer;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	/**
	 *属性公式计算表 
	 * @author dik
	 * 
	 */
	public class AttFormulaConfig
	{
		private static var _dataDic:Dictionary;
		public function AttFormulaConfig()
		{
		}
		
		public static function setup( data:ByteArray ):void
		{
			_dataDic = new Dictionary();
			
			var arr : Array = data.readObject();
			
			for each(var info : Q_att_transfer in arr) {
				var list:Vector.<ClientAttFormula>=new Vector.<ClientAttFormula>();
				var att:ClientAttFormula;
				var arr1:Array=JSON.parse(info.q_attributes) as Array;
				for(var i:int=0;i<arr1.length;i++){
					att=new ClientAttFormula();
					att.type=arr1[i].type;
					att.value=arr1[i].value;
					list.push(att);
				}
				_dataDic[info.id] = list;
			}
		}
		
		public static function getAttFormula(jobType:String):Vector.<ClientAttFormula>
		{
			return _dataDic[jobType];
		}
	}
}