package com.rpgGame.appModule.guild.war
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.QKindomnameCfgData;
	import com.rpgGame.coreData.clientConfig.Q_kindomname;
	import com.rpgGame.coreData.enum.EnumCity;
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
				var cityId:int=msg.citys[i].id;
				if(msg.cityType==3&&cityId!=EnumCity.HUANG_CHENG){
					var cfg:Q_kindomname=QKindomnameCfgData.getInfoByZone(msg.citys[i].areaId);
					cityId=cfg.q_id;
				}
				_cityData.add(cityId,msg.citys[i]);
			}
		}
	}
}