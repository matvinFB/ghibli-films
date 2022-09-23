import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';
import 'package:learning_project/src/config/themes/theme_controller.dart';
import 'package:learning_project/src/home/widgets/glassmorphismCard.dart';

import '../../models/film.dart';

class FilmListViewItem extends StatelessWidget {
  Film film;
  int index;
  FilmListViewItem(this.film, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    var theme = GetIt.I.get<ThemeController>().currentTheme;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 225,
              child: Align(
                alignment: index%2!=0?Alignment.centerRight:Alignment.centerLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(120)),
                  child: _DefaultImage(
                    url:
                        'https://www.researchgate.net/profile/Samanta-Teixeira/publication/284185703/figure/fig5/AS:753784720457731@1556727690809/Figura-5-O-Logotipo-do-Estudio-Ghibli-A-Imagem-do-Personagem-Totoro-Tornou-se-Marca_Q640.jpg',
                        height: 160,
                  ),
                ),
              ),
            ),
            GlassCard(
              blur: 2.5,
              opacity: 0.4,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: reverseDecision([
                        SizedBox(
                            width: 140, child: _DefaultImage(url: film.image)),
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                film.title ?? '',
                                textAlign: TextAlign.start,
                                maxLines: 4,
                                style: theme.textTheme.titleMedium,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                film.description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                                style: theme.textTheme.bodySmall,
                              )
                            ],
                          ),
                        )
                      ], index)),
                ),
              ),
            ),
          ],
        ),
        Divider(
          thickness: 2,
          height: 40,
        )
      ],
    );
  }
}

List<Widget> reverseDecision(List<Widget> list, int index) {
  if (index % 2 == 0) {
    return list.reversed.toList();
  }
  return list;
}

class _DefaultImage extends StatelessWidget {
  final String url;
  final double? height;
  _DefaultImage({url, this.height})
      : this.url = url ??
            'https://i.pinimg.com/564x/96/f5/74/96f574989a973e7f18daeba878b238d7.jpg';
  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      scale: 1,
      height: height,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return CircularProgressIndicator(
          color: Colors.white,
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
              : null,
        );
      },
      errorBuilder: (context, error, stackTrace) {
        print(error);
        return Text('Your error widget...');
      },
    );
  }
}
