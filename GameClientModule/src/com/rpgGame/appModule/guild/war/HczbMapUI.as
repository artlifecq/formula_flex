package com.rpgGame.appModule.guild.war
{
	import org.mokylin.skin.app.banghui.huangcheng.Cont_HuangCheng;
	
	/**
	 * 皇城争霸地图
	 * @author dik
	 * 2017-7-26
	 */
	public class HczbMapUI extends GuildWarMapUI
	{
		private var _skin:Cont_HuangCheng;
		public function HczbMapUI()
		{
			_skin=new Cont_HuangCheng();
			super(_skin);
		}
	}
}