set -o errexit -o nounset

rev=$(git rev-parse --short HEAD)

REPONAME=`basename $PWD`
PARENTDIR=`dirname $PWD`
USERNAME=`basename $PARENTDIR`
cd out

git init
git config user.name "test"
git config user.email "test"

git remote add upstream "https://$GH_TOKEN@github.com/$USERNAME/$REPONAME.git"
git fetch upstream
git reset upstream/gh-pages

touch .

ls
git status

if [ "$TRAVIS_BRANCH" != "master" ]
then
  echo "This commit was made against the $TRAVIS_BRANCH and not the master! No deploy!"
  exit 0
fi

git add -A .
git commit -m "rebuild pages at ${rev}"
git push -q upstream HEAD:gh-pages
