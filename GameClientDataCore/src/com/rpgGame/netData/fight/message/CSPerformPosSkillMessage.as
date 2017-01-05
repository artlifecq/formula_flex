package com.rpgGame.netData.fight.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 释放技能请求
	 */
	public class CSPerformPosSkillMessage extends Message {
	
		//技能ID
		private var _skillId: int;
		
		//攻击朝向
		private var _fightDirection: int;
		
		//攻击坐标x(像素坐标)
		private var _x: int;
		
		//攻击坐标y((像素坐标)
		private var _y: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//技能ID
			writeInt(_skillId);
			//攻击朝向
			writeShort(_fightDirection);
			//攻击坐标x(像素坐标)
			writeShort(_x);
			//攻击坐标y((像素坐标)
			writeShort(_y);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//技能ID
			_skillId = readInt();
			//攻击朝向
			_fightDirection = readShort();
			//攻击坐标x(像素坐标)
			_x = readShort();
			//攻击坐标y((像素坐标)
			_y = readShort();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 102210;
		}
		
		/**
		 * get 技能ID
		 * @return 
		 */
		public function get skillId(): int{
			return _skillId;
		}
		
		/**
		 * set 技能ID
		 */
		public function set skillId(value: int): void{
			this._skillId = value;
		}
		
		/**
		 * get 攻击朝向
		 * @return 
		 */
		public function get fightDirection(): int{
			return _fightDirection;
		}
		
		/**
		 * set 攻击朝向
		 */
		public function set fightDirection(value: int): void{
			this._fightDirection = value;
		}
		
		/**
		 * get 攻击坐标x(像素坐标)
		 * @return 
		 */
		public function get x(): int{
			return _x;
		}
		
		/**
		 * set 攻击坐标x(像素坐标)
		 */
		public function set x(value: int): void{
			this._x = value;
		}
		
		/**
		 * get 攻击坐标y((像素坐标)
		 * @return 
		 */
		public function get y(): int{
			return _y;
		}
		
		/**
		 * set 攻击坐标y((像素坐标)
		 */
		public function set y(value: int): void{
			this._y = value;
		}
		
	}
}