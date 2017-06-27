package com.rpgGame.appModule.guild.war
{
	import com.rpgGame.app.sender.GuildSender;
	import com.rpgGame.app.ui.common.DefaultPageItemRender;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.netData.guildWar.bean.GuildWarCityApplyInfo;
	
	import org.mokylin.skin.app.banghui.wangcheng.ZhengBa_Item;
	
	import starling.display.DisplayObject;
	
	import utils.TimerServer;
	
	/**
	 *王城争霸战申请列表渲染器 
	 * @author dik
	 * 
	 */
	public class WczbWarApplyItemRender extends DefaultPageItemRender
	{
		private var _skin:ZhengBa_Item;
		private var _leftTime:int;
		
		public function WczbWarApplyItemRender()
		{
			_skin=new ZhengBa_Item();
			super(_skin);
		}
		
		
		override public function get height():Number
		{
			if(_skin){
				return _skin.height;
			}
			return 0;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target==_skin.btnPai){
				var info:GuildWarCityApplyInfo=_data as GuildWarCityApplyInfo;
				GuildSender.reqGuildWarApply(info.id,0);
			}
		}
		
		override protected function commitData():void
		{
			if(_skin){
				var info:GuildWarCityApplyInfo=_data as GuildWarCityApplyInfo;
				_skin.lbCityName.text=info.name;
				_skin.lbTeamName1.text=info.occupyGuildName;
				_skin.lbTeamName2.text=info.curMaxPriceGuildName;
				_skin.lbJiage.text=info.curMaxPrice.toString();
				_leftTime=info.overTime;
				TimerServer.addSecTick(updateTime,null,_leftTime);
				_skin.lbTime.text=TimeUtil.format3TimeType(_leftTime);
			}
		}
		
		private function updateTime():void
		{
			_leftTime--;
			_skin.lbTime.text=TimeUtil.format3TimeType(_leftTime);
		}
	}
}