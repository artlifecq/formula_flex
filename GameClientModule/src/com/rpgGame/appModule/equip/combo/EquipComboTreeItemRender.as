package com.rpgGame.appModule.equip.combo
{
	import com.game.engine3D.vo.IFrameRender;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.goods.ItemManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.core.ui.tip.RewardMarkTip;
	import com.rpgGame.core.ui.tip.RewardTipTree;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.HeChengData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_hecheng;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import away3d.events.Event;
	
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
	import org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonShuye;
	import org.mokylin.skin.common.ItemBg;
	import org.mokylin.skin.common.over.SelectBtn;
	
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
		private var _mainListStyles:Array=[ButtonJianding,ButtonBianshi,ButtonShuye];
		private var _ndata:INodeData;
		private var _rewardTip:RewardMarkTip;
		public function EquipComboTreeItemRender()
		{
			super();
		}
		
		override protected function initialize():void
		{
			_skin=new HeChengMenuItemSkin();
			_skin.toSprite(this);
			var detailskin:Cont_Item=_skin.detail_item.skin as Cont_Item;
			detailskin.selectedBtn.defaultIcon=null;
			var btnSkin:SelectBtn=new SelectBtn();
			detailskin.selectedBtn.upSkin=btnSkin.__SelectBtn_UIAsset2;
			detailskin.selectedBtn.hoverSkin=btnSkin.__SelectBtn_UIAsset1;
			detailskin.selectedBtn.selectedUpSkin=btnSkin.__SelectBtn_UIAsset1;
			detailskin.selectedBtn.selectedDownSkin=btnSkin.__SelectBtn_UIAsset1;
			detailskin.selectedBtn.selectedHoverSkin=btnSkin.__SelectBtn_UIAsset1;
			detailskin.selectedBtn.downSkin=btnSkin.__SelectBtn_UIAsset1;
			detailskin.selectedBtn.isSelected=false;
			_rewardTip=new RewardMarkTip(this,244);
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
				var oldindex:int=tree.selectedIndex;
				tree.selectedItem=treeNode;
				tree.dataProvider.updateItemAt(tree.selectedIndex);
				tree.dataProvider.updateItemAt(oldindex);
			}
		}
		override public function dispose():void
		{
			super.dispose();
			
		}
		override protected function renderTreeNode(node:TreeNode):void
		{
			this._ndata=node.data as INodeData;
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
			//	var nodeKey:String=MainNodeInfo(node.data).getRTNkey();
//				if (!RewardTipTree.ins.getNode(nodeKey)) 
//				{
//					RewardTipTree.ins.addNode(RTNodeID.EQUIP_HC,nodeKey,this,244,ItemManager.checkEquip2HCByType,false,node.data.type);
//				}
//				RewardTipTree.ins.updateNode(nodeKey);
				var has:Boolean=ItemManager.checkEquip2HCByType(node.data.type);
				_rewardTip.hasReward=has;
				RewardTipTree.ins.updateNode(RTNodeID.EQUIP_HC);
			}else if(node.data is SubNodeInfo){
				this.addChild(_skin.sub_item);
				_skin.main_item.removeFromParent();
				_skin.detail_item.removeFromParent();
				_renderHeight=_skin.sub_item.height;
				var subSkin:HedSub_Item=_skin.sub_item.skin as HedSub_Item;
				var subInfo:SubNodeInfo=node.data as SubNodeInfo;
//				if (!RewardTipTree.ins.getNode(subInfo.getRTNkey())) 
//				{
//					RewardTipTree.ins.addNode(subInfo.getParentKey(),subInfo.getRTNkey(),_skin.sub_item,244,null);
//				}
				subSkin.labelDisplay.text=HeChengData.getSubName(subInfo.type,subInfo.subType);
				var has:Boolean=ItemManager.chackIsCanHC(subInfo.type,subInfo.subType);
//				RewardTipTree.ins.setState(subInfo.getRTNkey(),has);
				_rewardTip.hasReward=has;
				if(node.expanded){
					subSkin.btnFlag.styleClass=ButtonSanjiao_down;
				}else{
					subSkin.btnFlag.styleClass=ButtonSanjiao_right;
				}
			}
			else if(node.data is DetailNodeInfo)
			{
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
				var pice:int=hechengData.q_money; //一个的单价
				var itemId:int=hechengData.q_item_id;
				var qianSkin:Cont_Item=_skin.detail_item.skin as Cont_Item;
				qianSkin.lb_Dispaly.color=ItemConfig.getItemQualityColor(itemId);
				qianSkin.lb_Dispaly.text=ItemConfig.getItemName(itemId)+"("+max+")";
				var has:Boolean=max>0&&(pice<=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_MONEY)||
					pice<=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_MONEY));
//				if (!RewardTipTree.ins.getNode(detailInfo.getRTNkey())) 
//				{
//					RewardTipTree.ins.addNode(detailInfo.getParentKey(),detailInfo.getRTNkey(),_skin.detail_item,244,null);
//				}
//				RewardTipTree.ins.setState(detailInfo.getRTNkey(),has);
				_rewardTip.hasReward=has;
				(qianSkin.bg.skin as ItemBg).bg1.visible=detailInfo.data.q_subson_type%2==0;
				(qianSkin.bg.skin as ItemBg).bg2.visible=!(qianSkin.bg.skin as ItemBg).bg1.visible;
				var isSelected:Boolean
				if(this.owner&&this.owner.selectedItem){
					isSelected=this.owner.selectedItem.data==node.data;
				}
				qianSkin.selectedBtn.isSelected=isSelected;
				qianSkin.selectedBtn.defaultIcon=null;
				if(this.owner.selectedItem&&this.owner.selectedItem.data is DetailNodeInfo==false){
					qianSkin.selectedBtn.toggleGroup.selectedIndex=-1;
				}
			}
			_rewardTip.setTip2Top();
		}
	}
}