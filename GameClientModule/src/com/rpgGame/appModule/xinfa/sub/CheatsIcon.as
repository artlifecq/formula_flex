package com.rpgGame.appModule.xinfa.sub
{
	import com.rpgGame.app.view.icon.BaseIcon;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.cheats.CheatsCfg;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.cheats.CheatsVo;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.utils.FilterUtil;
	
	import starling.display.DisplayObjectContainer;

	public class CheatsIcon
	{
		private var _icon:BaseIcon;
		public function CheatsIcon(con:DisplayObjectContainer)
		{
			_icon=new BaseIcon(IcoSizeEnum.ICON_42);
			_icon.x=(con.width-_icon.width)*0.5;
			_icon.y=(con.height-_icon.height)*0.5;
			con.addChild(_icon);
		}
		
		public function clear():void
		{
			_icon.clear();
			_icon.filter=null;
			TipTargetManager.remove(this._icon.parent);
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
			var tipStr:String="与《$》相生，本心法$提升$%";
			tipStr=LanguageConfig.replaceStr(tipStr,[CheatsCfg.getCheats(effectArr[0]).q_name,CharAttributeType.getCNName(effectArr[2]),(effectArr[3]/10000).toFixed(2)]);
			TipTargetManager.show( this._icon.parent, TargetTipsMaker.makeSimpleTextTips(tipStr));
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