package com.rpgGame.appModule.redreward
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.type.AssetUrl;
	
	import feathers.controls.Scroller;
	import feathers.controls.UIAsset;
	import feathers.data.ListCollection;
	import feathers.layout.VerticalLayout;
	
	import gs.TweenLite;
	import gs.easing.Expo;
	
	import org.mokylin.skin.app.hongbao.HongBao_Chai;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	
	public class RedRewardGetPanle extends SkinUIPanel
	{
		private var _skin:HongBao_Chai;
		private var _headImg:UIAsset;
		private var _job:int = 1;
		private var _onecellList:Vector.<RedRewardOneCell>;
		private var _moreList:Vector.<RedRewardMoreCell>;
		public function RedRewardGetPanle():void
		{
			_skin = new HongBao_Chai();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_headImg=new UIAsset();
			_headImg.x=101;
			_headImg.y=32;
			_skin.container.addChild(_headImg);
			var mask:Sprite = new Sprite();
			mask.graphics.drawRect(0,0,this.width,this.height);
			_skin.container.addChildAt(mask,0);
			_skin.container.mask = mask;
			_onecellList = new Vector.<RedRewardOneCell>();
			_moreList = new Vector.<RedRewardMoreCell>();
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			refeashOpenValue();
		}
		
		private function refeashOpenValue():void
		{
			switch(_job){
				case JobEnum.ROLE_1_TYPE:
					_headImg.styleName=AssetUrl.HEAD_ICON_1;
					break;
				case JobEnum.ROLE_2_TYPE:
					_headImg.styleName=AssetUrl.HEAD_ICON_2;
					break;
				case JobEnum.ROLE_3_TYPE:
					_headImg.styleName=AssetUrl.HEAD_ICON_3;
					break;
				case JobEnum.ROLE_4_TYPE:
					_headImg.styleName=AssetUrl.HEAD_ICON_4;
					break;
			}
			
			_skin.uiUp.y = 0;
			_skin.uiDown.y = 227;
			_skin.grpChai.visible = true;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btnChai:
					openHandler();
					break;
				case _skin.btnContinue:
					refeashOpenValue();
					break;
			}
		}
		private var count:int = 0;
		private function openHandler():void
		{
			_skin.grpChai.visible = false;
			TweenLite.to(_skin.uiUp,0.3,{y : -184,ease:Expo.easeIn});
			TweenLite.to(_skin.uiDown,0.3,{y : 503,ease:Expo.easeIn});
			if(count%2==0)
				refeashOneView();
			else
				refeashMoreView();
			count++;
		}
		
		private function refeashMoreView():void
		{
			_skin.skinFlip.visible = true;
			_skin.itemgroup.removeChildren();
			for(var i:int = 0;i<7;i++)
			{
				var cell:RedRewardMoreCell = getMoreNextCell(i);
				cell.y = 31*i;
				_skin.itemgroup.addChild(cell);
				cell.updata(i);
			}
		}
		
		private function refeashOneView():void
		{
			_skin.skinFlip.visible = false;
			_skin.itemgroup.removeChildren();
			for(var i:int = 0;i<8;i++)
			{
				var cell:RedRewardOneCell = getOneNextCell(i);
				cell.y = 31*i;
				_skin.itemgroup.addChild(cell);
				cell.updata(i);
			}
		}
		
		
		private function getOneNextCell(index:int):RedRewardOneCell
		{
			if(index<_onecellList.length)
				return _onecellList[index];
			
			var cell:RedRewardOneCell = new RedRewardOneCell();
			_onecellList.push(cell);
			return cell;
		}
		
		private function getMoreNextCell(index:int):RedRewardMoreCell
		{
			if(index<_moreList.length)
				return _moreList[index];
			
			var cell:RedRewardMoreCell = new RedRewardMoreCell();
			_moreList.push(cell);
			return cell;
		}
	}
}