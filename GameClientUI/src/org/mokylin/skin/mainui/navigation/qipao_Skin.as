package org.mokylin.skin.mainui.navigation
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import org.mokylin.skin.mainui.navigation.mc.UIMovieClipQipaoNumber;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class qipao_Skin extends feathers.controls.StateSkin
	{
		public var Num:feathers.controls.UIMovieClip;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function qipao_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 20;
			this.width = 18;
			this.elementsContent = [__qipao_Skin_UIAsset1_i(),Num_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Num_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			Num = temp;
			temp.name = "Num";
			temp.autoPlay = false;
			temp.height = 14;
			temp.styleClass = org.mokylin.skin.mainui.navigation.mc.UIMovieClipQipaoNumber;
			temp.width = 13;
			temp.x = 2;
			temp.y = 2;
			return temp;
		}

		private function __qipao_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/qipao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}