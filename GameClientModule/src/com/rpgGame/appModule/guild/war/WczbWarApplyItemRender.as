package com.rpgGame.appModule.guild.war
{
	import com.rpgGame.app.cmdlistener.enum.OpaqueEnum;
	import com.rpgGame.app.sender.GuildSender;
	import com.rpgGame.app.sender.GuildWarSender;
	import com.rpgGame.app.ui.common.BgListItemRender;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.enum.EnumCity;
	import com.rpgGame.netData.guildWar.bean.GuildWarCityApplyInfo;
	
	import feathers.utils.filter.GrayFilter;
	
	import org.mokylin.skin.app.banghui.wangcheng.ZhengBa_Item;
	
	import starling.display.DisplayObject;
	
	/**
	 *王城争霸战申请列表渲染器 
	 * @author dik
	 * 
	 */
	public class WczbWarApplyItemRender extends BgListItemRender
	{
		private var _leftTime:int;
		
		public function WczbWarApplyItemRender()
		{
			super();
		}
		
		override protected function initialize():void
		{
			_skin=new ZhengBa_Item();
			_skin.toSprite(this);
		}
		
		private function get skin():ZhengBa_Item
		{
			return _skin as ZhengBa_Item;
		}
		
		override public function get height():Number
		{
			return 27;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			var info:GuildWarCityApplyInfo=_data as GuildWarCityApplyInfo;
			if(target==skin.btnPai){
				var op:int;
				switch(info.id){
					case EnumCity.XI_WEI:
						op=OpaqueEnum.XI_WEI;
						break;
					case EnumCity.ZHONG_WEI:
						op=OpaqueEnum.ZHONG_WEI;
						break;
					case EnumCity.DONG_WEI:
						op=OpaqueEnum.DONG_WEI;
						break;
				}
				GuildWarSender.reqGuildWarApply(info.id,op);
			}else if(target==skin.lbTeamName1&&info.occupyGuildName){
				GuildSender.reqGuildBriefnessInfo(info.occupyGuildId);
			}else if(target==skin.lbTeamName2&&info.curMaxPriceGuildName){
				GuildSender.reqGuildBriefnessInfo(info.curMaxPriceGuildId);
			}
		}
		
		override protected function commitData():void
		{
			super.commitData();
			if(_skin){
				var info:GuildWarCityApplyInfo=_data as GuildWarCityApplyInfo;
				var applayCityId:int=this.owner.customData.applayCityId;
				skin.lbCityName.text=info.name;
				skin.lbTeamName1.text=info.occupyGuildName&&info.occupyGuildName.length!=0?getNoZoneName(info.occupyGuildName):"无";
				skin.lbTeamName2.text=info.curMaxPriceGuildName&&info.curMaxPriceGuildName.length!=0?getNoZoneName(info.curMaxPriceGuildName):"无";
				skin.lbJiage.text=info.curMaxPrice.toString();
				_leftTime=info.overTime;
				skin.lbTime.text=TimeUtil.format3TimeType(_leftTime);
				if(info.id==applayCityId||applayCityId==-1){
					GrayFilter.unGray(skin.btnPai);
				}else{
					GrayFilter.gray(skin.btnPai);
				}
			}
		}
		
		private function getNoZoneName(name:String):String
		{
			var index:int=name.indexOf("]");
			return name.slice(index+1);
		}
		
		public function updateTime():void
		{
			_leftTime--;
			_data.overTime=_leftTime;
			if(_leftTime<0){//竞拍结束自动关闭
				AppManager.hideApp(AppConstant.GUILD_WCZB_APPLY);
				return;
			}
			skin.lbTime.text=TimeUtil.format3TimeType(_leftTime);
		}
	}
}