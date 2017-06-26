package org.mokylin.skin.app.banghui.wangcheng
{
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.app.zhanchang.wangchengzhengba.WangChengInfo_Item;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ZhengBaVsNameItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var guild0:feathers.controls.SkinnableContainer;

		public var guild1:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ZhengBaVsNameItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [guild1_i(),guild0_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function guild0_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			guild0 = temp;
			temp.name = "guild0";
			temp.height = 24;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.wangchengzhengba.WangChengInfo_Item()
			temp.skin = skin
			temp.width = 187;
			temp.x = 0;
			temp.y = 24;
			return temp;
		}

		private function guild1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			guild1 = temp;
			temp.name = "guild1";
			temp.height = 24;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.wangchengzhengba.WangChengInfo_Item()
			temp.skin = skin
			temp.width = 187;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}