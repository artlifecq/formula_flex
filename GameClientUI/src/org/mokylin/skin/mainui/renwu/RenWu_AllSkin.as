package org.mokylin.skin.mainui.renwu
{
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.mainui.renwu.Huanshi_Renwu;
	import org.mokylin.skin.mainui.renwu.RenWuZhuiZong_Skin;
	import org.mokylin.skin.mainui.renwu.RenWu_open;
	import org.mokylin.skin.mainui.renwu.Zhuxian_Renwu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class RenWu_AllSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var renwu_close:feathers.controls.SkinnableContainer;

		public var renwu_huan:feathers.controls.SkinnableContainer;

		public var renwu_open:feathers.controls.SkinnableContainer;

		public var renwu_zhu:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RenWu_AllSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 335;
			this.width = 253;
			this.elementsContent = [renwu_close_i(),renwu_open_i(),renwu_huan_i(),renwu_zhu_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function renwu_close_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			renwu_close = temp;
			temp.name = "renwu_close";
			temp.height = 335;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.RenWuZhuiZong_Skin()
			temp.skin = skin
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function renwu_huan_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			renwu_huan = temp;
			temp.name = "renwu_huan";
			temp.height = 376;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Huanshi_Renwu()
			temp.skin = skin
			temp.width = 298;
			temp.x = -340;
			temp.y = 0;
			return temp;
		}

		private function renwu_open_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			renwu_open = temp;
			temp.name = "renwu_open";
			temp.height = 135;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.RenWu_open()
			temp.skin = skin
			temp.width = 21;
			temp.x = 234;
			temp.y = 0;
			return temp;
		}

		private function renwu_zhu_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			renwu_zhu = temp;
			temp.name = "renwu_zhu";
			temp.height = 378;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Zhuxian_Renwu()
			temp.skin = skin
			temp.width = 298;
			temp.x = -659;
			temp.y = 0;
			return temp;
		}

	}
}