package com.rpgGame.netData.mibao.message{
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送奖励信息
	 */
	public class SCMiBaoRewardInfoMessage extends Message {
	
		//0:挑战成功  1:挑战失败
		private var _type: int;
		
		//累计积分
		private var _jifenNum: int;
		
		//获得经验
		private var _exp: int;
		
		//获得真气
		private var _zhenqiNum: int;
		
		//伤害排名
		private var _rank: int;
		
		//奖励
		private var _reward: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//0:挑战成功  1:挑战失败
			writeByte(_type);
			//累计积分
			writeInt(_jifenNum);
			//获得经验
			writeInt(_exp);
			//获得真气
			writeInt(_zhenqiNum);
			//伤害排名
			writeInt(_rank);
			//奖励
			writeShort(_reward.length);
			for (i = 0; i < _reward.length; i++) {
				writeBean(_reward[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//0:挑战成功  1:挑战失败
			_type = readByte();
			//累计积分
			_jifenNum = readInt();
			//获得经验
			_exp = readInt();
			//获得真气
			_zhenqiNum = readInt();
			//伤害排名
			_rank = readInt();
			//奖励
			var reward_length : int = readShort();
			for (i = 0; i < reward_length; i++) {
				_reward[i] = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 131105;
		}
		
		/**
		 * get 0:挑战成功  1:挑战失败
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 0:挑战成功  1:挑战失败
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 累计积分
		 * @return 
		 */
		public function get jifenNum(): int{
			return _jifenNum;
		}
		
		/**
		 * set 累计积分
		 */
		public function set jifenNum(value: int): void{
			this._jifenNum = value;
		}
		
		/**
		 * get 获得经验
		 * @return 
		 */
		public function get exp(): int{
			return _exp;
		}
		
		/**
		 * set 获得经验
		 */
		public function set exp(value: int): void{
			this._exp = value;
		}
		
		/**
		 * get 获得真气
		 * @return 
		 */
		public function get zhenqiNum(): int{
			return _zhenqiNum;
		}
		
		/**
		 * set 获得真气
		 */
		public function set zhenqiNum(value: int): void{
			this._zhenqiNum = value;
		}
		
		/**
		 * get 伤害排名
		 * @return 
		 */
		public function get rank(): int{
			return _rank;
		}
		
		/**
		 * set 伤害排名
		 */
		public function set rank(value: int): void{
			this._rank = value;
		}
		
		/**
		 * get 奖励
		 * @return 
		 */
		public function get reward(): Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>{
			return _reward;
		}
		
		/**
		 * set 奖励
		 */
		public function set reward(value: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>): void{
			this._reward = value;
		}
		
	}
}