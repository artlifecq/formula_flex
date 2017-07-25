package com.rpgGame.appModule.fightsoul
{
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import org.mokylin.skin.app.zhanhun.Shuxing_Skin;

	public class PropView
	{
		private var _skin:Shuxing_Skin;
		private var _typeId:int;
		private var _isSHow:Boolean = false;
		public function PropView(skin:Shuxing_Skin,typeId:int):void
		{
			_skin = skin;
			_typeId = typeId;
			_skin.lb_name.width = NaN;
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
		private var _disace:int;
		private function refeashView():void
		{
			var currentPropValue:int;
			var nextPropValue:int;
			for(var i:int = 1;i<=15;i++)
			{
				if(_currentatt["q_type"+i]==_typeId)
				{
					currentPropValue = _currentatt["q_value"+i];
				}
				
				if(_nextAtt["q_type"+i]==_typeId)
				{
					nextPropValue = _nextAtt["q_value"+i];
				}
			}
			_skin.lb_name.text = currentPropValue.toString();
			_skin.grp_up.x = _skin.lb_name.x +_skin.lb_name.width+5;
			_disace = nextPropValue-currentPropValue;
			_skin.lb_Num.text = _disace.toString();
		}
		
		public function showUpLevelView(bool:Boolean):void
		{
			if(_disace==0)
			{
				bool = false;
			}
			_isSHow = bool;
			_skin.lb_Num.visible = bool;
			_skin.arrow_up.visible = bool;
		}
	}
}