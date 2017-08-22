package org.mokylin.skin.app.huanying
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.huanying.button.ButtonKaishijinru;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HuanYing_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var startBtn:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HuanYing_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 467;
			this.width = 912;
			this.elementsContent = [bg_i(),startBtn_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/app/huanying/bg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function startBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			startBtn = temp;
			temp.name = "startBtn";
			temp.height = 52;
			temp.styleClass = org.mokylin.skin.app.huanying.button.ButtonKaishijinru;
			temp.width = 174;
			temp.x = 472;
			temp.y = 322;
			return temp;
		}

	}
}