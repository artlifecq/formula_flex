package com.rpgGame.appModule.mount
{
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import org.mokylin.skin.app.zuoqi.Shuxing_Item;
	
	public class MountPropView
	{
		private var _skin:Shuxing_Item;
		private var _isSHow:Boolean = false;
		public function MountPropView(skin:Shuxing_Item,type:int):void
		{
			_skin = skin;
			_attpropId = type;
		}
		
		/*public function get index():int
		{
			return _index;
		}*/
		private var _currentatt:Number;
		private var _nextAtt:Number;
		private var _addatt:Number;
		private var _attpropId:int;
		private var _job:int;
		public function updataAtt(currentatt:Vector.<Number>,addatt:Vector.<Number>,nextatt:Vector.<Number>,job:int = 1):void
		{
			_currentatt = getValueByType(currentatt);
			_nextAtt = getValueByType(nextatt);
			_addatt = getValueByType(addatt);
			_job = job;
			refeashView();
			showUpLevelView(_isSHow);
		}
		private function getValueByType(list:Vector.<Number>):Number
		{
			if(list == null||list.length<_attpropId)
				return 0;
			else
				return list[_attpropId];
		}
		private function refeashView():void
		{
			if(_attpropId==0)
			{
				_skin.container.visible = false;
				return ;
			}
			_skin.container.visible = true;		
//			var attname:String = CharAttributeType.getCNName(_attpropId);
//			_skin.lbName.text = attname;
			_skin.lbCurrent.text = AttValueConfig.getDisAttValueStr(_attpropId,_currentatt);
			if(_addatt>0)
			{
				var num:Number = AttValueConfig.getDisAttValue(_attpropId,_addatt);
				if(num>0)
				{
					_skin.lbTemp.text= "  +"+num+CharAttributeType.getAttrUnit(_attpropId)+"(临时)";
				}
				
			}else{
				_skin.lbTemp.text= "";
			}
			
			if(_nextAtt>0)
			{
				_skin.lbUp.text = AttValueConfig.getDisAttValueStr(_attpropId,_nextAtt);
			}else{
				_skin.lbUp.text = "";
				_skin.ico_up.visible = false;
			}
		}
		
		public function showUpLevelView(bool:Boolean):void
		{
			if(_nextAtt==0)
				return ;
			
			_isSHow = bool;
			_skin.lbUp.visible = bool;
			_skin.ico_up.visible = bool;
			_skin.lbTemp.visible = !bool;
		}
	}
}