package org.mokylin.skin.app.zhuangbei.hecheng
{
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.app.zhuangbei.hecheng.Cont_Item;
	import org.mokylin.skin.app.zhuangbei.hecheng.HedMain_Item;
	import org.mokylin.skin.app.zhuangbei.hecheng.HedSub_Item;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HeChengMenuItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var detail_item:feathers.controls.SkinnableContainer;

		public var main_item:feathers.controls.SkinnableContainer;

		public var sub_item:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HeChengMenuItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [detail_item_i(),main_item_i(),sub_item_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function detail_item_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			detail_item = temp;
			temp.name = "detail_item";
			temp.height = 32;
			var skin:StateSkin = new org.mokylin.skin.app.zhuangbei.hecheng.Cont_Item()
			temp.skin = skin
			temp.width = 245;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function main_item_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			main_item = temp;
			temp.name = "main_item";
			temp.height = 44;
			var skin:StateSkin = new org.mokylin.skin.app.zhuangbei.hecheng.HedMain_Item()
			temp.skin = skin
			temp.width = 244;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function sub_item_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sub_item = temp;
			temp.name = "sub_item";
			temp.height = 30;
			var skin:StateSkin = new org.mokylin.skin.app.zhuangbei.hecheng.HedSub_Item()
			temp.skin = skin
			temp.width = 248;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}