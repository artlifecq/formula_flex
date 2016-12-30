package org.mokylin.skin.component.scrollbar
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.scrollbar.skin_pack.button.ScrollBarSkin_decre;
	import org.mokylin.skin.component.scrollbar.skin_pack.button.ScrollBarSkin_incre;
	import org.mokylin.skin.component.scrollbar.skin_pack.button.ScrollBarSkin_thumb;
	import org.mokylin.skin.component.scrollbar.skin_pack.button.ScrollBarSkin_track;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ScrollBarSkin_pack extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var decrement:feathers.controls.Button;

		public var increment:feathers.controls.Button;

		public var thumb:feathers.controls.Button;

		public var track:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ScrollBarSkin_pack()
		{
			super();
			
			this.currentState = "button";
			this.height = 193;
			this.elementsContent = [];
			track_i();
			decrement_i();
			increment_i();
			thumb_i();
			
			
			states = {
			};
			skinNames={"button":"org.mokylin.skin.component.scrollbar.skin_pack.button.ScrollBarSkin_track,org.mokylin.skin.component.scrollbar.skin_pack.button.ScrollBarSkin_decre,org.mokylin.skin.component.scrollbar.skin_pack.button.ScrollBarSkin_incre,org.mokylin.skin.component.scrollbar.skin_pack.button.ScrollBarSkin_thumb"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function decrement_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			decrement = temp;
			temp.name = "decrement";
			temp.left = 0;
			temp.styleClass = org.mokylin.skin.component.scrollbar.skin_pack.button.ScrollBarSkin_decre;
			temp.top = 0;
			return temp;
		}

		private function increment_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			increment = temp;
			temp.name = "increment";
			temp.bottom = 0;
			temp.left = 0;
			temp.styleClass = org.mokylin.skin.component.scrollbar.skin_pack.button.ScrollBarSkin_incre;
			return temp;
		}

		private function thumb_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			thumb = temp;
			temp.name = "thumb";
			temp.height = 53;
			temp.left = 0;
			temp.styleClass = org.mokylin.skin.component.scrollbar.skin_pack.button.ScrollBarSkin_thumb;
			temp.top = 31;
			temp.width = 18;
			return temp;
		}

		private function track_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			track = temp;
			temp.name = "track";
			temp.bottom = 16;
			temp.left = 1;
			temp.styleClass = org.mokylin.skin.component.scrollbar.skin_pack.button.ScrollBarSkin_track;
			temp.top = 16;
			return temp;
		}

	}
}