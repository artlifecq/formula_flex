package com.rpgGame.appModule.fightsoul
{
	import com.rpgGame.app.manager.fightsoul.FightSoulManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.cfg.FightsoulData;
	import com.rpgGame.coreData.clientConfig.Q_fightsoul;
	import com.rpgGame.netData.fightsoul.bean.FightSoulInfo;
	
	import org.mokylin.skin.app.zhanhun.Zhanhun_Skin;
	
	public class FightSoulPanel extends SkinUIPanel
	{
		private var _skin:Zhanhun_Skin;
		private var _currentQuality:int;
		public function FightSoulPanel():void
		{
			_skin=new Zhanhun_Skin();
			super(_skin);
			initData();
			initView();
		}
		private function initData():void
		{
			_currentQuality = shetdata.q_quality;
		}
		
		private function initView():void
		{
			refeashQualityView();
		}
		
		private function refeashQualityView():void
		{
			if(_currentQuality<0)
				_currentQuality = 0;
			else if(_currentQuality> FightsoulData.maxQuality)
				_currentQuality = FightsoulData.maxQuality
			var sheet:Q_fightsoul = FightsoulData.getInfoByQuality(_currentQuality);
			_skin.Num_dengji.label = fightSoulInfo.level.toString();
		}
		private function get  shetdata():Q_fightsoul
		{
			return FightSoulManager.instance().shetdata;
		}
		private  function get fightSoulInfo(): FightSoulInfo{
			return FightSoulManager.instance().fightSoulInfo;
		}
	}
}