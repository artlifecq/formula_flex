package com.rpgGame.appModule.gm
{
    import com.rpgGame.app.sender.GmSender;
    import com.rpgGame.core.ui.SkinUI;
    import com.rpgGame.coreData.cfg.item.ItemConfig;
    import com.rpgGame.coreData.clientConfig.Q_item;
    
    import app.message.GoodsDataProto;
    
    import away3d.events.Event;
    
    import feathers.controls.List;
    import feathers.data.ListCollection;
    
    import org.client.mainCore.ds.HashMap;
    import org.mokylin.skin.app.gmpanel.GmItemBoxSkin;
    
    import starling.display.DisplayObject;

    public class GmItem extends SkinUI 
    {

        private var skin:GmItemBoxSkin;
        private var typeMap:HashMap;
        private var itemMap:HashMap;
        private var qianzhuiMap:HashMap;
        private var itemId:int;
        private var type:int;

        public function GmItem()
        {
            skin = new GmItemBoxSkin();
            super(skin);
            init();
        }

        private function init():void
        {
            typeMap = new HashMap();
            itemMap = new HashMap();
            typeMap.add(0, "所有");
            typeMap.add(1, "装备");
            typeMap.add(18, "材料");
            typeMap.add(13, "鲜花榜礼物");
            skin.quality.dataProvider = new ListCollection([0, 1, 2, 3, 4]);
            skin.type.dataProvider = new ListCollection(typeMap.getValues());
            skin.itemId.dataProvider = new ListCollection();
            skin.type.addEventListener("change", onTypeChange);
            skin.itemId.addEventListener("change", onItemChange);
            skin.qianzhui.dataProvider = new ListCollection(qianzhuiMap.getValues());
            setType(0);
        }

        private function onItemChange(e:Event):void
        {
            itemId = itemMap.key(skin.itemId.selectedItem);
            var list:List = skin.itemId.getList();
            if (list)
            {
				list.height = 400;
            }
        }

        private function onTypeChange(e:Event):void
        {
            var type:int = typeMap.key(skin.type.selectedItem);
            setType(type);
        }

        private function setType(type:int):void
        {
            var items:Array = null;
            this.type = type;
            itemMap.clear();
            if (type == 0)
            {
				items = ItemConfig.getAllItems();
            }
            else
            {
				items = ItemConfig.getItemsByType(type);
            }
            for each (var item:Q_item in items)
            {
                if (!itemMap.key(item.q_name))
                {
                    itemMap.add(item.q_id, item.q_name);
                }
            }
            skin.itemId.dataProvider = new ListCollection(itemMap.getValues());
        }

        override protected function onTouchTarget(target:DisplayObject):void
        {
            var _local5:int;
            var _local3:int;
            var _local2:int;
            var _local4:int;
            switch (target)
            {
                case skin.btnConfirm:
                    if (type == 1)
                    {
                        _local5 = skin.quality.selectedIndex;
                        _local3 = qianzhuiMap.key(skin.qianzhui.selectedItem);
                        _local2 = Number(skin.labInfo.text);
                        _local4 = 0;
                        while (_local4 < _local2)
                        {
                            GmSender.sendMsg("goods zb " + itemId + " " + _local5 + " " + _local3 + " 0");
                            _local4++;
                        }
                    }
                    else
                    {
                        GmSender.sendMsg("goods give " + itemId + " " + skin.labInfo.text);
                    }
                    return;
            }
        }
    }
}