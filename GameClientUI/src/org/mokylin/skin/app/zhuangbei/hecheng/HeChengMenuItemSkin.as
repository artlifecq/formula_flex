package org.mokylin.skin.app.zhuangbei.hecheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.app.zhuangbei.hecheng.Cont_Item_qian;
	import org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonErji_bg;
	import org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonJianding;

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

		public var main_item:feathers.controls.Button;

		public var sub_item:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HeChengMenuItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [sub_item_i(),main_item_i(),detail_item_i()];
			
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
			var skin:StateSkin = new org.mokylin.skin.app.zhuangbei.hecheng.Cont_Item_qian()
			temp.skin = skin
			temp.width = 245;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function main_item_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			main_item = temp;
			temp.name = "main_item";
			temp.height = 44;
			temp.styleClass = org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonJianding;
			temp.width = 244;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function sub_item_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sub_item = temp;
			temp.name = "sub_item";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.height = 36;
			temp.label = "初级鉴定图纸";
			temp.styleClass = org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonErji_bg;
			temp.color = 0xE1D4A9;
			temp.width = 248;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}