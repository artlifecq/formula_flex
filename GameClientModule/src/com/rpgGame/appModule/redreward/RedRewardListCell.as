package com.rpgGame.appModule.redreward
{
	import com.rpgGame.netData.redreward.bean.RedRewardState;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.hongbao.HongBao_ListItem;
	import org.mokylin.skin.common.ItemBg;
	
	public class RedRewardListCell extends DefaultListItemRenderer
	{
		public function RedRewardListCell():void
		{
			super();
		}
		private var _skin:HongBao_ListItem;
		override protected function initialize():void
		{
			_skin = new HongBao_ListItem();
			_skin.toSprite(this);
		}
		
		override protected function commitData():void
		{
			var info:RedRewardState = this.data as RedRewardState;
			_skin.lbName.text = info.playerName;
			if(info.state==0)
				_skin.lbHand.text = "已领取";
			else
				_skin.lbHand.text = "明日领取";
			var isshow:Boolean = this.index%2==0;
			ItemBg(_skin.bg.skin).bg1.visible = isshow;
			ItemBg(_skin.bg.skin).bg2.visible = !isshow;
		}
		
		override public function get width():Number
		{
			return _skin.width;
		}
		
		override public function get height():Number
		{
			return _skin.height;
		}
	}
}