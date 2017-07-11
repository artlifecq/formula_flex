package com.rpgGame.appModule.xinfa.sub
{
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.cheats.CheatsCfg;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.cheats.CheatsVo;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.utils.FilterUtil;
	
	import feathers.controls.UIAsset;
	
	import starling.display.DisplayObjectContainer;

	public class CheatsIcon
	{
		private var _icon:BgIcon;
		public function CheatsIcon(con:DisplayObjectContainer)
		{
			_icon=new BgIcon(IcoSizeEnum.ICON_36);
			if(con is UIAsset){
				con.parent.addChild(_icon);
				con.width=con.height=44;
				_icon.bindBg(con as UIAsset);
			}else{
				con.addChild(_icon);
			}
//			_icon.x=(con.width-_icon.width)*0.5;
//			_icon.y=(con.height-_icon.height)*0.5;
		}
		
		public function clear():void
		{
			_icon.clear();
			_icon.filter=null;
			TipTargetManager.remove(this._icon);
		}
		/**
		 *设置数据 
		 * @param data 相生心法
		 * @param effectArr
		 * 
		 */		
		public function setCheatsData(data:CheatsVo,effectArr:Array):void
		{
			_icon.setIconResName(ClientConfig.getCheatsIcon(data.cheatsConfig.q_icon,IcoSizeEnum.ICON_42));
			//var tipStr:String="与《$》相生，本心法$提升$";
			var tipStr:String=NotifyCfgData.getNotifyTextByID(61006);
			tipStr=LanguageConfig.replaceStr(tipStr,[CheatsCfg.getCheats(effectArr[0]).q_name,CharAttributeType.getCNName(effectArr[2]),(effectArr[3])]);
			TipTargetManager.show( this._icon, TargetTipsMaker.makeSimpleTextTips(tipStr));
			if (data.level>0) 
			{
				_icon.filter=null;
			}
			else
			{
				_icon.filter=FilterUtil.getGrayFilter();
			}
		}
	}
}