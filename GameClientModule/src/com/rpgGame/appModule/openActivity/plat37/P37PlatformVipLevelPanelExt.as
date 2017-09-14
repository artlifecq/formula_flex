package com.rpgGame.appModule.openActivity.plat37
{
	import com.rpgGame.app.manager.GlobalFunction;
	import com.rpgGame.app.manager.platform.P_37wan;
	import com.rpgGame.app.manager.platform.PlatformUtil;
	import com.rpgGame.app.ui.main.openActivity.BaseCampSubWithListPanel;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.info.openActivity.ActivityVo;
	
	import org.mokylin.skin.app.tequan.TQ_Tequanlibao;
	
	import starling.display.DisplayObject;
	
	public class P37PlatformVipLevelPanelExt extends BaseCampSubWithListPanel
	{
		private var _skin:TQ_Tequanlibao;
		public function P37PlatformVipLevelPanelExt()
		{
			_skin=new TQ_Tequanlibao();
			super(_skin, _skin.listCont, P37PlatformVipLevelItemExt);
		}
		override public function setData(infos:Vector.<ActivityVo>):void
		{
			super.setData(infos);
			if (PlatformUtil.is37()) 
			{
				_skin.lbLv.text=int(ClientConfig.clientParams[ "pt_vip" ])+"";
			}
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if (target==_skin.lbPingtai) 
			{
				var p37:P_37wan=PlatformUtil.platform as P_37wan;
				if (p37) 
				{
					p37.goMoreVip();
				}
			}
			else if (target==_skin.btnChongzhi) 
			{
				GlobalFunction.iWantRecharge();
			}
		}
	}
}