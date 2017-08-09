package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.guild.bean.GuildApplyInfo;
	
	import away3d.events.Event;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.banghui.ItemShenqin;
	
	public class GuildApplyInfoCell extends DefaultListItemRenderer
	{
		private var _skin:ItemShenqin;
		public function GuildApplyInfoCell():void
		{
			super();
		}
		
		override protected function initialize():void
		{
			_skin = new ItemShenqin();
			_skin.toSprite(this);
			_skin.btnCancel.addEventListener(Event.TRIGGERED,triggeredHandler);
			_skin.btnOk.addEventListener(Event.TRIGGERED,triggeredHandler);
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
		
		override protected function commitData():void
		{
			if(info==null)
				return ;
			_skin.lbRolenName.text = info.name;
			_skin.lbZhanli.text = info.battle.toString();
			_skin.lbLevel.htmlText = info.level+"级"+HtmlTextUtil.getTextColor(0xff0000,ItemUtil.getJobName(info.job));
		}
		
		private function get info():GuildApplyInfo
		{
			return this.data as GuildApplyInfo;
		}
		
		
		override public function get height():Number
		{
			return _skin.height;
		}
		
		override public function get width():Number
		{
			return _skin.width;
		}
	}
}