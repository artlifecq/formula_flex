package com.rpgGame.app.manager.role
{
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.task.PickAutoManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.SceneSender;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.SceneDropGoodsEvent;
	import com.rpgGame.coreData.lang.LangText;
	import com.rpgGame.coreData.role.SceneDropGoodsData;
	import com.rpgGame.coreData.role.SceneDropGoodsItem;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 场景掉落物管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2016-04-15 上午10:02:16
	 *
	 */
	public class SceneDropGoodsManager
	{
		private static var _nextCanPickUpTime : int = 0;

		public function SceneDropGoodsManager()
		{
		}

		public static function setup() : void
		{
		}

		public static function selectedDropGoods(dropGoodsData : SceneDropGoodsData) : void
		{
			if (!dropGoodsData)
			{
				return;
			}
			if (dropGoodsData.goodsDatas)
			{
				SceneSender.requestPickUpGoodsInfo(dropGoodsData.goodsDatas.dropGoodsId);
//				dropGoodsDatasInit(dropGoodsData);
				PickAutoManager.getInstance().autoPickCtrl.SetPickingState(false);
			}
			else
			{
//				SceneSender.requestPickUpGoodsInfo(dropGoodsData.goodsDatas.dropGoodsId);
			}
		}

		private static function dropGoodsDatasInit(dropGoodsData : SceneDropGoodsData) : void
		{
			AppManager.showAppNoHide(AppConstant.DROP_GOODS_LIST_PANEL, dropGoodsData);
		}

		/**
		 * 拾取单个物品
		 * @param dropGoodsData
		 * @param goodsProto
		 *
		 */
		public static function pickUpGoods(dropGoodsData : SceneDropGoodsData, goodsItem : SceneDropGoodsItem) : void
		{
			var currTime : Number = SystemTimeManager.curtTm;
			if (currTime > _nextCanPickUpTime)
			{
				/*_nextCanPickUpTime = currTime + dropGoodsData.pickCd;
				var index : int = dropGoodsData.goodsDatas.indexOf(goodsItem);
				if (index > -1)
				{
					SceneSender.requestPickUpGoods(dropGoodsData.id, index);
				}*/
			}
			else
			{
				NoticeManager.showNotify(LangText.PICK_UP_GOODS_IS_CD);
			}
		}

		/**
		 * 拾取所有物品
		 * @param dropGoodsData
		 * @param goodsProto
		 *
		 */
		/*		public static function pickUpAllGoods(dropGoodsData : SceneDropGoodsData) : void
				{
					var currTile : int = getTimer();
					if (currTile - lastPickUpTime > PICK_UP_GOODS_CD)
					{
						lastPickUpTime = currTile;
						if (dropGoodsData.goodsDatas)
						{
							var len : int = dropGoodsData.goodsDatas.length;
							for (var index : int = 0; index < len; index++)
							{
								SceneSender.requestPickUpGoods(dropGoodsData.id, index);
							}
						}
					}
					else
					{
		//				NoticeManager.showNotify(LangText.PICK_UP_GOODS_IS_CD);
					}
				}*/

		public static function pickUpGoodsInfoInit(sceneGoodsId : Number, goodsItems : Vector.<SceneDropGoodsItem>) : void
		{
			var dropGoods : SceneRole = SceneManager.getSceneObjByID(sceneGoodsId) as SceneRole;
			if (dropGoods)
			{
				var dropGoodsData : SceneDropGoodsData = dropGoods.data as SceneDropGoodsData;
//				dropGoodsData.goodsDatas = goodsItems;
				dropGoodsDatasInit(dropGoodsData);
				EventManager.dispatchEvent(SceneDropGoodsEvent.DROP_GOODS_DATAS_UPDATE, dropGoodsData);
			}
		}

		public static function removeGoods(sceneGoodsId : Number, index : int) : void
		{
			var dropGoods : SceneRole = SceneManager.getSceneObjByID(sceneGoodsId) as SceneRole;
			if (dropGoods && dropGoods.type == SceneCharType.DROP_GOODS)
			{
				var dropGoodsData : SceneDropGoodsData = dropGoods.data as SceneDropGoodsData;
			/*	if (dropGoodsData.goodsDatas && index > -1 && index < dropGoodsData.goodsDatas.length)
				{
					dropGoodsData.goodsDatas[index].isPicked = true;
				}*/
				EventManager.dispatchEvent(SceneDropGoodsEvent.REMOVE_DROP_GOODS_DATA, dropGoodsData);
			}
			else
			{
				if (dropGoods)
					NoticeManager.showNotify("服务器移除的的不是一个掉落物！id:" + dropGoods.id + "，name:" + dropGoods.name);
			}
		}

		public static function setNextCanPickUpTime(time : Number) : void
		{
			_nextCanPickUpTime = time;
		}

		public static function get canPickUpSurplusTime() : int
		{
			var currTime : Number = SystemTimeManager.curtTm;
			return _nextCanPickUpTime - currTime;
		}
	}
}
