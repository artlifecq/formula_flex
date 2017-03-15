package com.rpgGame.appModule.die
{
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.player.message.ResPlayerDieMessage;
	
	import flash.net.dns.AAAARecord;
	
	import org.mokylin.skin.app.siwangfuhuo.fuhuo_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 *死亡面板 
	 * @author dik
	 * 
	 */
	public class DiePanel extends SkinUIPanel
	{
		private var _skin:fuhuo_Skin;
		private var disMsg:ResPlayerDieMessage;

		private var openNum:int;
		private var items:Vector.<DieToItem>;

		private var openTime:int;
		
		public function DiePanel()
		{
			_skin=new fuhuo_Skin();
			super(_skin);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			disMsg=data as ResPlayerDieMessage;
			
			_skin.lbl_msg.color=0xe1201c;
			var date:Date=new Date(disMsg.time*1000);
			_skin.lbl_msg.htmlText="你被"+HtmlTextUtil.getTextColor(0x5DBD37,disMsg.attackername)+"杀死了,("+date.fullYear+"年"+
				(date.month+1)+"月"+date.date+"日  "+date.hours+":"+date.minutes+":"+date.seconds+")";
			
			openNum=4;
			openTime=30;
			items=new Vector.<DieToItem>();
			for(var i:int=0;i<4;i++){
				items.push(new DieToItem());
				this._skin.container.addChild(items[i]);
				items[i].y=140;
				items[i].x=_skin.btn_prev.x+items[i].width*i+5;
				items[i].update();
			}
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btn_yuandi:
					break;
				case _skin.btn_goumai:
					break;
				case _skin.btn_fuhuodian:
					break;
				case _skin.btn_prev:
					break;
				case _skin.btn_next:
					break;
			}
		}
	}
}