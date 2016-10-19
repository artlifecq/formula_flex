package com.game.engine3D.state
{

	/**
	 *
	 * 状态接口
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-9 下午5:25:12
	 *
	 */
	public interface IState
	{
		/**
		 * 初始化
		 * @param owner
		 *
		 */
		function init(machine : StateMachine) : void;
		/**
		 * 进入状态通道
		 * @param prevState 上一个状态
		 * @param force 强制
		 * @return
		 *
		 */
		function enterPass(prevState : IState, force : Boolean = false) : Boolean;
		/**
		 * 离开状态通道
		 * @param nextState 下一个状态
		 * @param force 强制
		 * @return
		 *
		 */
		function leavePass(nextState : IState, force : Boolean = false) : Boolean;
		/**
		 * 进入前
		 *
		 */
		function beforeEnter() : void;
		/**
		 * 进入
		 *
		 */
		function enter() : void;
		/**
		 * 进入后
		 *
		 */
		function afterEnter() : void;
		/**
		 * 执行前
		 * @param ref 状态引用
		 *
		 */
		function beforeExecute(ref : StateReference) : void;
		/**
		 * 执行
		 *
		 */
		function execute() : void;
		/**
		 * 执行后
		 *
		 */
		function afterExecute() : void;
		/**
		 * 退出前
		 *
		 */
		function beforeLeave() : void;
		/**
		 * 退出
		 *
		 */
		function leave() : void;
		/**
		 * 退出后
		 *
		 */
		function afterLeave() : void;
		/**
		 * 暂停
		 *
		 */
		function pause() : void;
		/**
		 * 恢复
		 *
		 */
		function resume() : void;
		/**
		 * 引用
		 * @return
		 *
		 */
		function get ref() : StateReference;
		/**
		 * 种群，互斥或共存的依据
		 * @return
		 *
		 */
		function get tribe() : String;
		/**
		 * 类型
		 * @return
		 *
		 */
		function get type() : uint;
		function get isDisposed() : Boolean;
		function dispose() : void;
	}
}
