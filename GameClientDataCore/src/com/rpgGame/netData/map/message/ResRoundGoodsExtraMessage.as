package com.rpgGame.netData.map.message{
	import com.rpgGame.netData.structs.Position;
	import com.rpgGame.netData.map.bean.DropGoodsInfo;
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 周围掉落物品加强版（用于一些需要定制表现的地方）
	 */
	public class ResRoundGoodsExtraMessage extends Message {
	
		//掉落类型（1 BOSS掉落表现）
		private var _droptype: int;
		
		//掉落对象Id
		private var _droptargetId: long;
		
		//掉落源位置
		private var _dropsrcpos: com.rpgGame.netData.structs.Position;
		
		//物品信息
		private var _goods: DropGoodsInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//掉落类型（1 BOSS掉落表现）
			writeByte(_droptype);
			//掉落对象Id
			writeLong(_droptargetId);
			//掉落源位置
			writeBean(_dropsrcpos);
			//物品信息
			writeBean(_goods);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//掉落类型（1 BOSS掉落表现）
			_droptype = readByte();
			//掉落对象Id
			_droptargetId = readLong();
			//掉落源位置
			_dropsrcpos = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			//物品信息
			_goods = readBean(DropGoodsInfo) as DropGoodsInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 101146;
		}
		
		/**
		 * get 掉落类型（1 BOSS掉落表现）
		 * @return 
		 */
		public function get droptype(): int{
			return _droptype;
		}
		
		/**
		 * set 掉落类型（1 BOSS掉落表现）
		 */
		public function set droptype(value: int): void{
			this._droptype = value;
		}
		
		/**
		 * get 掉落对象Id
		 * @return 
		 */
		public function get droptargetId(): long{
			return _droptargetId;
		}
		
		/**
		 * set 掉落对象Id
		 */
		public function set droptargetId(value: long): void{
			this._droptargetId = value;
		}
		
		/**
		 * get 掉落源位置
		 * @return 
		 */
		public function get dropsrcpos(): com.rpgGame.netData.structs.Position{
			return _dropsrcpos;
		}
		
		/**
		 * set 掉落源位置
		 */
		public function set dropsrcpos(value: com.rpgGame.netData.structs.Position): void{
			this._dropsrcpos = value;
		}
		
		/**
		 * get 物品信息
		 * @return 
		 */
		public function get goods(): DropGoodsInfo{
			return _goods;
		}
		
		/**
		 * set 物品信息
		 */
		public function set goods(value: DropGoodsInfo): void{
			this._goods = value;
		}
		
	}
}