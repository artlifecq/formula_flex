package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	
	import away3d.events.Event;
	
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.core.ToggleGroup;
	import feathers.events.FeathersEventType;
	
	import org.mokylin.skin.app.banghui.BangHui_Home_left;
	
	import starling.display.DisplayObject;
	

	public class CreateGuildPanel extends SkinUI
	{
		private var _skin:BangHui_Home_left;
		private var _group:ToggleGroup;
		public function CreateGuildPanel():void
		{
			_skin = new BangHui_Home_left();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			GuildManager.instance().defaultName = _skin.lbName.text;
			GuildManager.instance().defaultMsg = _skin.lbXuanYan.text;
			_skin.lbName.addEventListener(FeathersEventType.FOCUS_IN,forceinHandler);
			_skin.lbName.addEventListener(FeathersEventType.FOCUS_OUT,forceoutHandler);
			_skin.lbXuanYan.addEventListener(FeathersEventType.FOCUS_IN,forceinHandler);
			_skin.lbXuanYan.addEventListener(FeathersEventType.FOCUS_OUT,forceoutHandler);
			_group = new ToggleGroup();
			_skin.chk1.toggleGroup = _group;
			_skin.chk2.toggleGroup = _group;
			_group.selectedIndex = 0;
			var info:Object = GuildManager.instance().getcreateInfoByIndex(0);
			_skin.lbPay1.text = LanguageConfig.replaceStr(_skin.lbPay1.text,getConstType(info["type"],info["num"]),info["level"],info["level"]);
			info = GuildManager.instance().getcreateInfoByIndex(1);
			_skin.lbPay2.text = LanguageConfig.replaceStr(_skin.lbPay2.text,getConstType(info["type"],info["num"]),info["level"]);
		}
		
		private function getConstType(type:int,num:int):String
		{
			return num.toString()+ItemConfig.getItemName(type);
		}
		
		private function forceinHandler(evt:Event):void
		{
			var eduit:TextFieldTextEditor = evt.target as TextFieldTextEditor;
			var lable:String = GuildManager.instance().defaultName;
			if(eduit == _skin.lbXuanYan)
			{
				lable = GuildManager.instance().defaultMsg;
			}
			if(lable == eduit.text)
			{
				eduit.text = "";
				eduit.color = 0xffffff;
			}
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target== _skin.btnCreate)
			{
				GuildManager.instance().createGuild(_group.selectedIndex,_skin.lbName.text,_skin.lbXuanYan.text);
			}
		}
		private function forceoutHandler(evt:Event):void
		{
			var eduit:TextFieldTextEditor = evt.target as TextFieldTextEditor;
			if(eduit.text == "")
			{
				eduit.color = 0x8B8D7B;
				if(eduit == _skin.lbXuanYan)
				{
					eduit.text = GuildManager.instance().defaultMsg;
				}else{
					eduit.text = GuildManager.instance().defaultName;
				}
			}
		}
		
	}
}