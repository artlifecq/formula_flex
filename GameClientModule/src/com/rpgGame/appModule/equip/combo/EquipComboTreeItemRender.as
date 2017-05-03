package com.rpgGame.appModule.equip.combo
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.coreData.cfg.HeChengData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_hecheng;
	
	import feathers.controls.UIAsset;
	import feathers.controls.renderers.DefaultTreeItemRender;
	import feathers.data.TreeNode;
	
	import org.mokylin.skin.app.zhuangbei.hecheng.Cont_Item;
	import org.mokylin.skin.app.zhuangbei.hecheng.HeChengMenuItemSkin;
	import org.mokylin.skin.app.zhuangbei.hecheng.HedMain_Item;
	import org.mokylin.skin.app.zhuangbei.hecheng.HedSub_Item;
	import org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonBianshi;
	import org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonJiahao;
	import org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonJianding;
	import org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonJianhao;
	import org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonSanjiao_down;
	import org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonSanjiao_right;
	
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
		private var _mainListStyles:Array=[ButtonJianding,ButtonBianshi];
		
		private static var selectedImg:UIAsset;
		
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
				renderTreeNode(treeNode);
				tree.updateTree();
			}
			
			if(treeNode.data is DetailNodeInfo){
				var qianSkin:Cont_Item=_skin.detail_item.skin as Cont_Item;
				qianSkin.selectedImg.visible=true;
				if(selectedImg){
					selectedImg.visible=false;
				}
				selectedImg=qianSkin.selectedImg;
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
				var mainSkin:HedMain_Item=_skin.main_item.skin as HedMain_Item;
				var mainInfo:MainNodeInfo=node.data as MainNodeInfo;
				mainSkin.btnCont.styleClass=_mainListStyles[mainInfo.type-1];
				if(node.expanded){
					mainSkin.btnFlag.styleClass=ButtonJianhao;
					mainSkin.btnFlag.y=20;
				}else{
					mainSkin.btnFlag.styleClass=ButtonJiahao;
					mainSkin.btnFlag.y=12;
				}
			}else if(node.data is SubNodeInfo){
				this.addChild(_skin.sub_item);
				_skin.main_item.removeFromParent();
				_skin.detail_item.removeFromParent();
				_renderHeight=_skin.sub_item.height;
				var subSkin:HedSub_Item=_skin.sub_item.skin as HedSub_Item;
				var subInfo:SubNodeInfo=node.data as SubNodeInfo;
				subSkin.labelDisplay.text=HeChengData.getSubName(subInfo.type,subInfo.subType);
				if(node.expanded){
					subSkin.btnFlag.styleClass=ButtonSanjiao_down;
				}else{
					subSkin.btnFlag.styleClass=ButtonSanjiao_right;
				}
			}else if(node.data is DetailNodeInfo){
				this.addChild(_skin.detail_item);
				_skin.main_item.removeFromParent();
				_skin.sub_item.removeFromParent();
				_renderHeight=_skin.detail_item.height;
				var detailInfo:DetailNodeInfo=node.data as DetailNodeInfo;
				hechengData=detailInfo.data;
				if(hechengData==null) return;
				var cailiao:Array=JSONUtil.decode(hechengData.q_cost_items);
				var cailiaoId:int=parseInt(cailiao[0]);//材料id
				var cailiaoNum:int=parseInt(cailiao[1]);//合成材料数;
				var itemByBagNum:int=BackPackManager.instance.getBagItemsCountById(cailiaoId);
				var max:int=Math.floor(itemByBagNum/cailiaoNum);//能合成的数量
				var itemId:int=hechengData.q_item_id;
				var qianSkin:Cont_Item=_skin.detail_item.skin as Cont_Item;
				if(qianSkin.selectedImg!=selectedImg){
					qianSkin.selectedImg.visible=false;
				}
				qianSkin.lb_Dispaly.color=ItemConfig.getItemQualityColor(itemId);
				qianSkin.lb_Dispaly.text=ItemConfig.getItemName(itemId)+"("+max+")";
				qianSkin.bg1.visible=detailInfo.data.q_subson_type%2==0;
				qianSkin.bg2.visible=!qianSkin.bg1.visible;
			}
		}
	}
}