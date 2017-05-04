package com.rpgGame.appModule.mount
{
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import org.mokylin.skin.app.zuoqi.Shuxing_Item;

	public class MountPropView
	{
		private var _skin:Shuxing_Item;
		private var _index:int;
		private var _isSHow:Boolean = false;
		public function MountPropView(skin:Shuxing_Item,index:int):void
		{
			_skin = skin;
			_index = index;
		}
		
		public function get index():int
		{
			return _index;
		}
		private var _currentatt:Number;
		private var _nextAtt:Number;
		private var _attpropId:int;
		public function updataAtt(type:int,currentatt:Number=0,nextatt:Number=0):void
		{
			_currentatt = currentatt;
			_nextAtt = nextatt;
			_attpropId = type;
			refeashView();
			showUpLevelView(_isSHow);
		}
		private function refeashView():void
		{
			if(_attpropId==0)
			{
				_skin.container.visible = false;
				return ;
			}
			_skin.container.visible = true;
			var attname:String = CharAttributeType.getCNName(_attpropId);
			_skin.lbName.text = attname;
			_skin.lbCurrent.text = Math.floor(_currentatt).toString();
			if(_nextAtt>0)
			{
				_skin.lbUp.text = Math.floor(_nextAtt).toString();
			}else{
				_skin.lbUp.text = "";
			}
		}
		
		public function showUpLevelView(bool:Boolean):void
		{
			if(_nextAtt==0)
				return ;
			_isSHow = bool;
			_skin.lbUp.visible = bool;
			_skin.ico_up.visible = bool;
		}
	}
}