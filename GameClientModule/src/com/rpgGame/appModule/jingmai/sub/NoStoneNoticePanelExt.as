package com.rpgGame.appModule.jingmai.sub
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.coreData.cfg.meridian.EnumMStoneType;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import org.mokylin.skin.app.beibao.Xinfa.Bianshi_Tips;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class NoStoneNoticePanelExt extends SkinUIPanel
	{
		private var _skin:Bianshi_Tips;
		public function NoStoneNoticePanelExt()
		{
			_skin=new Bianshi_Tips();
			super(_skin);
		}
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data);
			var type:int=data;
			_skin.lbCailiao.htmlText="需要"+HtmlTextUtil.getTextColor(GameColorUtil.COLOR_RED,EnumMStoneType.getStoneTypeName(type));
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			//super.onTouchTarget(target);
			switch(target)
			{
				case _skin.lbFuben:
				{
					FunctionOpenManager.openPanelByFuncID(EmFunctionID.EM_DUORENFUBEN);
					break;
				}
				case _skin.lbJixian:
				{
					FunctionOpenManager.openPanelByFuncID(EmFunctionID.EM_ZHUANGBEIFUBEN);
					break;
				}
				case _skin.lbBoss:
				{
					FunctionOpenManager.openPanelByFuncID(EmFunctionID.EM_BOSS_ACT);
					break;
				}
				default:
				{
					break;
				}
			}
			hide();
		}
	}
}