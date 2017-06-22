package com.rpgGame.appModule.guild.war
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.view.ui.tip.vo.DynamicTipData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import feathers.controls.ScrollBarDisplayMode;
	
	import org.mokylin.skin.app.banghui.wangcheng.WangCheng_Skin;
	
	import starling.display.DisplayObject;
	
	/**
	 *王城争霸战 
	 * @author dik
	 * 
	 */
	public class WczbWarViewUI extends ViewUI
	{
		private var _skin:WangCheng_Skin;
		private var _tipsData1:DynamicTipData;
		private var _tipsData2:DynamicTipData;
		private var _tipsData3:DynamicTipData;
		private var _tipsData4:DynamicTipData;
		
		public function WczbWarViewUI()
		{
			_skin=new WangCheng_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.List.itemRendererType=WczbGuildFightRankItemRender;
			_skin.List.scrollBarDisplayMode = ScrollBarDisplayMode.NONE;
		}
		
		override public function show(data:Object=null):void
		{
			super.show(data);
			initEvent();
		}
		
		private function initEvent():void
		{
			_tipsData1=new DynamicTipData();
			_tipsData2=new DynamicTipData();
			_tipsData3=new DynamicTipData();
			_tipsData4=new DynamicTipData();
			TipTargetManager.show( _skin.grpWangCheng, TargetTipsMaker.makeTips( TipType.WCZB_REWAD_TIP,_tipsData1));
			TipTargetManager.show( _skin.grpCheng1, TargetTipsMaker.makeTips( TipType.WCZB_REWAD_TIP,_tipsData2));
			TipTargetManager.show( _skin.grpCheng2, TargetTipsMaker.makeTips( TipType.WCZB_REWAD_TIP,_tipsData3));
			TipTargetManager.show( _skin.grpCheng3, TargetTipsMaker.makeTips( TipType.WCZB_REWAD_TIP,_tipsData4));
		}
		
		private function showZhanshi(state:int):void
		{
			switch(state){
				case 1:
					unApply();
					break;
				case 2:
					applying();
					break;
				case 3:
					attackState();
					break;
				case 4:
					defState();
					break;
				case 5:
					holdState();
					break;
			}
		}
		
		private function holdState():void
		{
			var city:String="西卫";
			_skin.grpTo.visible=false;
			_skin.grpCheng.visible=true;
			_skin.lbHead.htmlText="占领"+city;
			_skin.lbName1.htmlText="";
			_skin.lbName2.htmlText="";
			_skin.lbVs.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_GREEN,"本帮已占领"+city);
			_skin.lbTime.text="";
			
			var cityStyleName:String="weicheng1";
			var flagStyleName:String="xiwei";
			_skin.uiCheng.styleName="ui/app/banghui/wangcheng/xiaocheng/"+cityStyleName+".png";
			_skin.uiMyFlag.styleName="ui/app/banghui/wangcheng/"+flagStyleName+".png";
		}
		
		private function defState():void
		{
			var city:String="西卫";
			_skin.grpTo.visible=false;
			_skin.grpCheng.visible=true;
			_skin.lbHead.htmlText="防守"+city;
			_skin.lbName1.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_GREEN,GuildManager.instance().guildData.name);
			var otherGuild:String="对手名称"
			_skin.lbVs.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_YELLOW,"VS");
			_skin.lbName2.text=HtmlTextUtil.getTextColor(StaticValue.UI_RED1,otherGuild);
			_skin.lbTime.text="距离战斗结束还有:20:20";
			
			var cityStyleName:String="weicheng1";
			var flagStyleName:String="xiwei";
			_skin.uiCheng.styleName="ui/app/banghui/wangcheng/xiaocheng/"+cityStyleName+".png";
			_skin.uiMyFlag.styleName="ui/app/banghui/wangcheng/"+flagStyleName+".png";
		}
		
		private function attackState():void
		{
			var city:String="西卫";
			_skin.grpTo.visible=false;
			_skin.grpCheng.visible=true;
			_skin.lbHead.htmlText="进攻"+city;
			_skin.lbName1.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_GREEN,GuildManager.instance().guildData.name);
			var otherGuild:String="对手名称"
			_skin.lbVs.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_YELLOW,"VS");
			_skin.lbName2.text=HtmlTextUtil.getTextColor(StaticValue.UI_RED1,otherGuild);
			_skin.lbTime.text="距离战斗结束还有:20:20";
			
			var cityStyleName:String="weicheng1";
			var flagStyleName:String="xiwei";
			_skin.uiCheng.styleName="ui/app/banghui/wangcheng/xiaocheng/"+cityStyleName+".png";
			_skin.uiMyFlag.styleName="ui/app/banghui/wangcheng/"+flagStyleName+".png";
		}
		
		private function applying():void
		{
			_skin.grpTo.visible=false;
			_skin.grpCheng.visible=true;
			var city:String="西卫";
			_skin.lbHead.htmlText="竞拍"+city;
			_skin.lbName1.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_YELLOW1,"当前出价最高帮派:");
			var highGuild:String="最高帮派名称啊"
			_skin.lbVs.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_GREEN,highGuild);
			_skin.lbName2.text="";
			_skin.lbTime.text="20:00";
			
			var cityStyleName:String="weicheng1";
			var flagStyleName:String="xiwei";
			_skin.uiCheng.styleName="ui/app/banghui/wangcheng/xiaocheng/"+cityStyleName+".png";
			_skin.uiMyFlag.styleName="ui/app/banghui/wangcheng/"+flagStyleName+".png";
		}
		
		private function unApply():void
		{
			_skin.grpTo.visible=true;
			_skin.grpCheng.visible=false;
			var city:String="西卫";
			_skin.lbHead.htmlText="竞拍"+city;
		}
		
		override public function hide():void
		{
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btnBaoming:
					AppManager.showApp(AppConstant.GUILD_WCZB_APPLY,null,"",this._skin.container);
					break;
				case _skin.btnInfo:
					AppManager.showApp(AppConstant.GUILD_WCZB_HISTORY,null,"",this._skin.container);
					break;
				case _skin.btnJiangli:
					AppManager.showApp(AppConstant.GUILD_WCZB_REWARD,null,"",this._skin.container);
					break;
				case _skin.btnJinru:
					break;
			}
		}
	}
}