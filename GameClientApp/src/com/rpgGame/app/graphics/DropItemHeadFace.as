package com.rpgGame.app.graphics
{
	import com.game.engine3D.core.poolObject.InstancePool;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.utils.HeadBloodUtil;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.role.SceneDropGoodsData;
	import com.rpgGame.coreData.type.AttachDisplayType;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import app.message.GoodsType;

	public class DropItemHeadFace extends BaseHeadFace
	{
		private static var dropItemHeadFacePool : InstancePool = new InstancePool("dropItemHeadFacePool", 300);
		/**
		 * 生成一个HeadBloodBar
		 */
		public static function create($role : SceneRole) : DropItemHeadFace
		{
			//利用池生成HeadBloodBar
			return dropItemHeadFacePool.createObj(DropItemHeadFace, $role) as DropItemHeadFace;
		}
		
		/**
		 * @private
		 * 回收一个HeadBloodBar
		 * @param bar
		 */
		public static function recycle(bar : HeadBloodBar) : void
		{
			//利用池回收HeadBloodBar
			dropItemHeadFacePool.disposeObj(bar);
		}
		private var _back:DropNameHeader;
		private var _nameBar : HeadNameBar;
		private var _dropdata:SceneDropGoodsData;
		public function DropItemHeadFace(role : SceneRole):void
		{
			super();
			reSet([role]);
		}
		override public function reSet($parameters : Array) : void
		{
			super.reSet($parameters);
			_role = $parameters[0] as SceneRole;
			_dropdata = _role.data as SceneDropGoodsData;
			_isSelected = false;
			_isShow = false;
			_isCamouflage = false;
			setTemporary();
		}
		override protected function initAddBar() : void
		{
			switch (_role.type)
			{
				case SceneCharType.DROP_GOODS:
					addBackandUpdataState();
					addAndUpdateName();
					break;
			}
		}
		private function addAndUpdateName() : void
		{
			if (_nameBar == null)
			{
				_nameBar = HeadNameBar.create();
				_nameBar.y = 0;
				this.addChild(_nameBar); //更新一下容器，从临时的到模型真正容器
			}
			var nameColor : uint = HeadBloodUtil.getRoleNameColor(_role);
			var qItem:Q_item=_role.data.qitem;
			var str:String="";
			if (qItem&&qItem.q_type==GoodsType.MONEY) 
			{
				str=_role.data.goodsDatas.num+"";
			}
			_nameBar.setName(str+HeadBloodUtil.getRoleName(_role));
			_nameBar.setColor(nameColor);
			if (_back) 
			{
				_back.width=_nameBar.textWidth+2;
			}
		}
		private function addBackandUpdataState():void
		{
			if (_back == null)
			{
				_back = DropNameHeader.create();
				this.addChild(_back); //更新一下容器，从临时的到模型真正容器
			}
			_back.isSelect(_isShow);
			_back.haveOwner(_dropdata.haveowner);
		}
		override protected function addAllBar() : void
		{
			addElement(_back);
			addElement(_nameBar);
		}
		override protected function updateShowAndHide() : void
		{
			var nameVisible:Boolean = (_dropdata.qitem.q_showDrop_name==1);
			showAndHideElement(_back, _isSelected || nameVisible);
			showAndHideElement(_nameBar, _isSelected || nameVisible);
		
			addBackandUpdataState();
		}
		override protected function updateAllBarPosition() : void
		{
			//玩家名字为标准位置
			if (_nameBar != null) //名字位置
			{
				_nameBar.x = int(-_nameBar.realWidth * 0.5);
				_nameBar.y = int(-15 - _nameBar.realHeight);
			}
			
			if(_back != null)
			{
				_back.x = int(-_back.width * 0.5);
				_back.y = int(-15 - _back.realHeight);
			}
			
			//-------------------更新显示隐藏状态
			updateShowAndHide();
		}
		public function get isSelected() : Boolean
		{
			return _isSelected;
		}
		
		public function set isSelected(value : Boolean) : void
		{
			if (_isSelected == value)
				return;
			_isSelected = value;
			updateShowAndHide();
		}
		
		private var _isShow:Boolean;

		public function get isShow():Boolean
		{
			return _isShow;
		}

		public function set isShow(value:Boolean):void
		{
			if (_isShow == value)
				return;
			_isShow = value;
			updateShowAndHide();
		}
		
	}
}