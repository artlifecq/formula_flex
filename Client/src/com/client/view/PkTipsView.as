package com.client.view
{
	import com.game.engine3D.utils.DisplayUtil;

	import flash.events.Event;

	import org.mokylin.skin.loading.PkTipsPanelSkin;

	import starling.core.Starling;
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	/**
	 *
	 * PK提示视图
	 * @author L.L.M.Sunny
	 * 创建时间：2016-06-28 下午6:05:12
	 *
	 */
	public class PkTipsView extends Sprite
	{
		private var _parent : DisplayObjectContainer;
		private var _panelSkin : PkTipsPanelSkin;
		private var _okFun : Function;
		private var _exitFun : Function;

		public function PkTipsView(parent : DisplayObjectContainer, okFun : Function, exitFun : Function)
		{
			_parent = parent;
			_okFun = okFun;
			_exitFun = exitFun;
			_panelSkin = new PkTipsPanelSkin();
			_panelSkin.toSprite(this);
			_panelSkin.lbTip.text = "《御龙在天WEB》是3D大型泛国战网页游戏，其宏大的战争玩法将包含不同阵营国家之间的PK内容，未满20周岁或无法接受此设计的玩家，请勿进入游戏！";
		}

		public function show() : void
		{
			_parent.addChild(this);
			this.addEventListener(starling.events.TouchEvent.TOUCH, onTouch);
			Starling.current.nativeStage.addEventListener(Event.RESIZE, onStageResize);
			onStageResize();
		}

		public function hide() : void
		{
			Starling.current.nativeStage.removeEventListener(Event.RESIZE, onStageResize);
			this.removeEventListener(starling.events.TouchEvent.TOUCH, onTouch);
			if (parent)
				parent.removeChild(this);
		}

		private function onStageResize(event : Event = null) : void
		{
			x = int((Starling.current.nativeStage.stageWidth - _panelSkin.width) * 0.5);
			y = int((Starling.current.nativeStage.stageHeight - _panelSkin.height) * 0.5);
		}

		private function onTouch(e : TouchEvent) : void
		{
			var t : Touch = e.getTouch(this, TouchPhase.ENDED);
			if (t != null && t.target != null)
			{
				if (t.target == _panelSkin.btnOk)
				{
					hide();
					if (_okFun != null)
					{
						_okFun();
					}
				}
				else if (t.target == _panelSkin.btnExit)
				{
					hide();
					if (_exitFun != null)
					{
						_exitFun();
					}
				}
			}
		}

		public function destroy() : void
		{
			hide();
			_panelSkin = null;
			_okFun = null;
			_exitFun = null;
			_parent = null;
			DisplayUtil.disposeDisplayContainer(this);
		}
	}
}
