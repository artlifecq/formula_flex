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
		private var _currentatt:Q_att_values;
		private var _nextAtt:Q_att_values;
		public function updataAtt(currentatt:Q_att_values,nextatt:Q_att_values):void
		{
			_currentatt = currentatt;
			_nextAtt = nextatt;
			refeashView();
			showUpLevelView(_isSHow);
		}
		private function refeashView():void
		{
			var attpropId:int = _currentatt["q_type"+_index];
			if(attpropId ==0&&_nextAtt!=null)
			{
				attpropId = _nextAtt["q_type"+_index];
			}
			if(attpropId==0)
			{
				_skin.container.visible = false;
				return ;
			}
			_skin.container.visible = true;
			var currentPropValue:int = _currentatt["q_value"+_index];
			var attname:String = CharAttributeType.getCNName(attpropId);
			_skin.lbName.text = attname;
			_skin.lbCurrent.text = currentPropValue.toString();
			if(_nextAtt!=null)
			{
				var nextPropValue:int = _nextAtt["q_value"+_index];
				_skin.lbUp.text = (nextPropValue-currentPropValue).toString();
			}else{
				_skin.lbUp.text = "";
			}
		}
		
		public function showUpLevelView(bool:Boolean):void
		{
			if(_nextAtt==null)
				return ;
			_isSHow = bool;
			_skin.lbUp.visible = bool;
			_skin.ico_up.visible = bool;
		}
	}
}