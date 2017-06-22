package org.mokylin.skin.app.activety.zonghe
{
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.app.activety.zonghe.Active_LiJinQiangDuo;
	import org.mokylin.skin.app.activety.zonghe.Active_TianJiangLiJin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Active_LiJinZhuiZong extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var skin1:feathers.controls.SkinnableContainer;

		public var skin2:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Active_LiJinZhuiZong()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [skin1_i(),skin2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function skin1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin1 = temp;
			temp.name = "skin1";
			temp.height = 359;
			var skin:StateSkin = new org.mokylin.skin.app.activety.zonghe.Active_TianJiangLiJin()
			temp.skin = skin
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function skin2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin2 = temp;
			temp.name = "skin2";
			temp.height = 212;
			var skin:StateSkin = new org.mokylin.skin.app.activety.zonghe.Active_LiJinQiangDuo()
			temp.skin = skin
			temp.width = 253;
			temp.x = 0;
			temp.y = 357;
			return temp;
		}

	}
}