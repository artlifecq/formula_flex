package org.mokylin.skin.app.banghui.huangcheng
{
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.banghui.huangcheng.HeadInfoItem;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Head_Info2 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var skin1:feathers.controls.SkinnableContainer;

		public var skin2:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Head_Info2()
		{
			super();
			
			this.currentState = "normal";
			this.height = 30;
			this.width = 162;
			this.elementsContent = [__Head_Info2_UIAsset1_i(),skin1_i(),skin2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Head_Info2_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/huangcheng/bgdi.png";
			temp.width = 162;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function skin1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin1 = temp;
			temp.name = "skin1";
			temp.height = 24;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.huangcheng.HeadInfoItem()
			temp.skin = skin
			temp.width = 51;
			temp.x = 37;
			temp.y = 2;
			return temp;
		}

		private function skin2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin2 = temp;
			temp.name = "skin2";
			temp.height = 24;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.huangcheng.HeadInfoItem()
			temp.skin = skin
			temp.width = 51;
			temp.x = 88;
			temp.y = 2;
			return temp;
		}

	}
}