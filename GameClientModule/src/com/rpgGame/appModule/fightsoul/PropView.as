package com.rpgGame.appModule.fightsoul
{
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import org.mokylin.skin.app.zhanhun.Shuxing_Skin;

	public class PropView
	{
		private var _skin:Shuxing_Skin;
		private var _index:int;
		public function PropView(skin:Shuxing_Skin,index:int):void
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
			showUpLevelView(false);
		}
		private function refeashView():void
		{
			var attpropId:int = _currentatt["q_type"+_index];
			if(attpropId ==0)
			{
				attpropId = _nextAtt["q_type"+_index];
				_skin.container.visible = false;
			}else{
				_skin.container.visible = true;
			}
			if(attpropId==0)
				return ;
			var currentPropValue:int = _currentatt["q_value"+_index];
			var nextPropValue:int = _nextAtt["q_value"+_index];
			var attname:String = CharAttributeType.getCNName(attpropId);
			_skin.lb_name.htmlText = attname+":"+HtmlTextUtil.getTextColor(0xCFC6AE,currentPropValue.toString());
			_skin.lb_Num.text = nextPropValue.toString();
		}
		
		public function showUpLevelView(bool:Boolean):void
		{
			_skin.lb_Num.visible = bool;
			_skin.arrow_up.visible = bool;
		}
	}
}