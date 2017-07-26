package com.rpgGame.appModule.guild.war
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.netData.guildWar.message.ResGuildWarCityInfoMessage;
	
	import feathers.controls.StateSkin;
	
	import org.client.mainCore.ds.HashMap;
	
	/**
	 * 争霸战地图
	 * @author dik
	 * 2017-7-26
	 */
	public class GuildWarMapUI extends SkinUI
	{
		protected var _msg:ResGuildWarCityInfoMessage;
		protected var _cityData:HashMap;
		
		public function GuildWarMapUI(skin:StateSkin=null)
		{
			super(skin);
			_cityData=new HashMap();
		}
		
		/**
		 *设置层次数据信息 
		 * @param msg
		 * 
		 */
		public function setCityData(msg:ResGuildWarCityInfoMessage):void
		{
			_msg=msg;
			for(var i:int=0;i<msg.citys.length;i++){
				_cityData.add(msg.citys[i].id,msg.citys[i]);
			}
		}
	}
}