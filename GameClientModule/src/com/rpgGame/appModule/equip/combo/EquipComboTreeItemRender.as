package com.rpgGame.appModule.equip.combo
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.coreData.cfg.HeChengData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_hecheng;
	
	import feathers.controls.Button;
	import feathers.controls.renderers.DefaultTreeItemRender;
	import feathers.data.TreeNode;
	
	import org.mokylin.skin.app.zhuangbei.hecheng.Cont_Item_qian;
	import org.mokylin.skin.app.zhuangbei.hecheng.HeChengMenuItemSkin;
	
	import starling.display.DisplayObject;
	
	/**
	 *装备树渲染器
	 *@author dik
	 *2017-4-25下午2:14:11
	 */
	public class EquipComboTreeItemRender extends DefaultTreeItemRender
	{
		private var _skin:HeChengMenuItemSkin;
		private var _renderHeight:Number;
		
		public function EquipComboTreeItemRender()
		{
			super();
		}
		
		override protected function initialize():void
		{
			_skin=new HeChengMenuItemSkin();
			_skin.toSprite(this);
		}
		
		override public function get height():Number
		{
			return _renderHeight;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(treeNode.hasChildren && target != toggleButton)
			{
				treeNode.expanded = !treeNode.expanded;
				tree.updateTree();
			}
		}
		
		override protected function renderTreeNode(node:TreeNode):void
		{
			var hechengData:Q_hecheng;
			if(node.data is MainNodeInfo){
				this.addChild(_skin.main_item);
				_skin.sub_item.removeFromParent();
				_skin.detail_item.removeFromParent();
				_renderHeight=_skin.main_item.height;
			}else if(node.data is SubNodeInfo){
				this.addChild(_skin.sub_item);
				_skin.main_item.removeFromParent();
				_skin.detail_item.removeFromParent();
				_renderHeight=_skin.sub_item.height;
				var subSkin:Button=_skin.sub_item;
				var subInfo:SubNodeInfo=node.data as SubNodeInfo;
				subSkin.label=HeChengData.getSubName(subInfo.type,subInfo.subType);
			}else if(node.data is DetailNodeInfo){
				this.addChild(_skin.detail_item);
				_skin.main_item.removeFromParent();
				_skin.sub_item.removeFromParent();
				_renderHeight=_skin.detail_item.height;
				var detailInfo:DetailNodeInfo=node.data as DetailNodeInfo;
				hechengData=HeChengData.getSonbySonTypeListByType(detailInfo.type,detailInfo.subType,detailInfo.detailType);
				if(hechengData==null) return;
				var cailiao:Array=JSONUtil.decode(hechengData.q_cost_items);
				var cailiaoId:int=parseInt(cailiao[0]);
				var itemByBagNum:int=BackPackManager.instance.getBagItemsCountById(cailiaoId);
				var qianSkin:Cont_Item_qian=_skin.detail_item.skin as Cont_Item_qian;
				qianSkin.lb_Dispaly.color=ItemConfig.getItemQualityColor(cailiaoId);
				qianSkin.lb_Dispaly.text=ItemConfig.getItemName(cailiaoId)+"("+itemByBagNum+")";
			}
		}
	}
}