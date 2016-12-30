package com.rpgGame.app.graphics
{
	import com.game.mainCore.libCore.pool.IPoolClass;
	import com.game.mainCore.libCore.pool.Pool;
	import com.rpgGame.app.manager.stall.StallManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.info.stall.StallData;
	
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.app.stall.StallTitle1Skin;
	import org.mokylin.skin.app.stall.StallTitle2Skin;
	import org.mokylin.skin.app.stall.StallTitleSkin;

	public class StallHeadFace extends BaseHeadFace implements IPoolClass
	{
		
		private static var headFacePool : Pool = new Pool("stallHeadFacePool", 300);
		
		/**
		 * 生成一个HeadFace
		 */
		public static function create(role : SceneRole) : StallHeadFace
		{
			//利用池生成HeadFace
			return headFacePool.createObj(StallHeadFace, role) as StallHeadFace;
		}
		
		/**
		 * @private
		 * 回收一个HeadFace
		 * @param headFace
		 */
		public static function recycle(headFace : StallHeadFace) : void
		{
			//利用池回收HeadFace
			headFacePool.disposeObj(headFace);
		}
		
		public function reSet($parameters : Array) : void
		{
			_role = $parameters[0] as SceneRole;
			_isSelected = false;
			_isCamouflage = false;
		}
		
		private static const LABEL_MIN_WIDTH : int = 80;
		private static const LABEL_MIN_HEIGHT : int = 30;
		public function StallHeadFace(role : SceneRole)
		{
			super();
			reSet([role]);
		}
		private var _stallBg : SkinnableContainer;
		override protected function initAddBar():void
		{
			addAndUpdateStallBg();
		}
		
		override protected function addAllBar():void
		{
			//不管是临时，还是模型加载完成的，这是不能为NULL
			if (container == null)
				return;
//			addElement(_stallBg);
			addAndUpdateStallBg();
		}
		
		public function addAndUpdateStallBg():void
		{
			if(!_stallBg)
			{
				_stallBg = new SkinnableContainer();
				_stallBg.touchable = _stallBg.touchGroup = false;
				_stallBg.touchAcross = true;
				container.addChild(_stallBg);
			}
			var stallData : StallData = _role.data as StallData;
			if(!stallData)
				return;
			var skin : StateSkin;
			var skinWidth : int = LABEL_MIN_WIDTH;
			var labelWidth : int;
			var labelX : int;
			var label : Label;
			var bg : UIAsset;
			switch(stallData.stallType)
			{
				case 0:
					//skin = new StallTitleSkin();
					skinWidth = 90;
					labelX = 20;
					break;
				case 1:
					//skin = new StallTitle1Skin();
					skinWidth = 100;
					labelX = 20;
					break;
				case 2:
					//skin = new StallTitle2Skin();
					skinWidth = 160;
					labelX = 60;
					break;
			}
			_stallBg.skin = skin;
			var isSelect : UIAsset = skin["isSelect"];
			if(isSelect)
				isSelect.visible = !StallManager.getIsSeeStall(stallData.playerId);
			label = skin["name"];
			label.color = StallManager.getStallColor(stallData.playerId);
			label.text = stallData.stallName;
			if(label.textWidth < LABEL_MIN_WIDTH)
				labelWidth = LABEL_MIN_WIDTH;
			else
				labelWidth = label.textWidth;
			bg = skin["bg"];
			_stallBg.width = bg.width = isSelect.width = labelWidth + skinWidth;
			label.width = bg.width - labelX * 2;
			label.x = labelX;
			if(stallData.stallType == 2 )
			{
				var left : UIAsset = skin["left"];
				var right : UIAsset = skin["right"];
				left.x = 20;
				right.x = bg.width - 56;
			}
			trace("摊位名称宽度:",_stallBg.width,"皮肤宽度：",skin.width);
		}
		
		override protected function updateAllBarPosition():void
		{
			//不管是临时，还是模型加载完成的，这是不能为NULL
			if (container == null)
				return;
			
			var startPosy : int = 0; //不是临时的，说明模型那么就按名字绑定点就好了
			if (isTemporary)
			{
				//临时的或都模型没有血条的那么这就是固定值，从脚底再加上这个值的位置
				startPosy = -100;
			}
			
			if(_stallBg != null && _stallBg.skin != null)
			{
				_stallBg.x = - _stallBg.width * 0.5;
				_stallBg.y = startPosy - LABEL_MIN_HEIGHT;
			}
			updateShowAndHide();
		}
		
		override protected function updateShowAndHide():void
		{
			showAndHideElement(_stallBg,true);
		}
		
		/**
		 * 销毁自身，需要重写 
		 * 
		 */		
		override public function recycleSelf():void
		{
			_stallBg = null;
			recycle(this);
		}
		
		
	}
}