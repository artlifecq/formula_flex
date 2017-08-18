package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.guild.bean.GuildApplyInfo;
	
	import away3d.events.Event;
	
	import org.mokylin.skin.app.banghui.ItemShenqin;
	import org.mokylin.skin.common.ItemBg;
	
	public class GuildApplyInfoCell extends SkinUI
	{
		private var _skin:ItemShenqin;
		private var info:GuildApplyInfo;
		private var index:int;
		public function GuildApplyInfoCell(i:int):void
		{
			_skin = new ItemShenqin();
			super(_skin);
			this.index=i;
			_skin.btnCancel.addEventListener(Event.TRIGGERED,triggeredHandler);
			_skin.btnOk.addEventListener(Event.TRIGGERED,triggeredHandler);
			updateSkin();
		}
		
		
		
		private function updateSkin():void
		{
			var item:ItemBg = _skin.bg.skin as org.mokylin.skin.common.ItemBg;
			if(this.index%2 ==0)
			{
				item.bg1.visible = true;
				item.bg2.visible = false;
			}else{
				item.bg1.visible = false;
				item.bg2.visible = true;
			}
			
		}
		private function triggeredHandler(e:Event):void
		{
			switch(e.target)
			{
				case _skin.btnCancel:
					if(GuildManager.instance().applyOperation(0,info.id))
					{
						//this.owner.dataProvider.removeItem(data);
					}
					break;
				case _skin.btnOk:
					if(GuildManager.instance().applyOperation(1,info.id))
					{
						//this.owner.dataProvider.removeItem(data);
					}
					break;
			}
		}
		
		public function setData(data:GuildApplyInfo):void
		{
			info=data;
			if(info==null)
			{
				_skin.gUI.visible=false;
				return ;
			}
			_skin.gUI.visible=true;
			_skin.lbRolenName.text = info.name;
			_skin.lbZhanli.text = info.battle.toString();
			_skin.lbLevel.htmlText = info.level+"级"+HtmlTextUtil.getTextColor(0xff0000,ItemUtil.getJobName(info.job));
		}

	}
}