package com.rpgGame.appModule.hubao
{
	import com.rpgGame.app.manager.HuBaoManager;
	import com.rpgGame.app.sender.HuBaoSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.alert.FangChenMiPanelExt;
	import com.rpgGame.core.events.HuBaoEvent;
	import com.rpgGame.core.utils.MCUtil;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.hubao.HuBaoTanKuang_Skin;
	
	import starling.display.DisplayObject;
	
	public class HuBaoTiShiPanelExt extends SkinUIPanel
	{
		private var _skin:HuBaoTanKuang_Skin;
		public function HuBaoTiShiPanelExt()
		{
			_skin=new HuBaoTanKuang_Skin();
			super(_skin);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.chk_ok:
					HuBaoManager.instance().istishi = _skin.chk_ok.isSelected;
					trace("是否勾选了不提示："+_skin.chk_ok.isSelected);
					break;
				case _skin.btn_ok:
					btnokHandler();
					break;
			}			
		}
		
		public static function showPanelMiUtil():HuBaoTiShiPanelExt
		{
			var panel:HuBaoTiShiPanelExt=new HuBaoTiShiPanelExt();
			if (panel)
			{
				panel.show();
			}
			return panel;
		}
		
		private function btnokHandler():void
		{
			var isnotice:int=HuBaoManager.instance().istishi?1:0;
			HuBaoSender.upCSConvoyGirlMessage(isnotice);
			EventManager.dispatchEvent(HuBaoEvent.HUBAO_STAR);
			MCUtil.removeSelf(this);
		}
		
		override public function hide() : void
		{
			super.hide();
			MCUtil.removeSelf(this);
		}
	}
}